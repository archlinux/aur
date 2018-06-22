# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=vicuna-bin
_pkgname=vicuna
pkgver=1.23
pkgrel=2
pkgdesc='Tool for uploading files to Wikimedia Commons and other Wikimedia projects'
arch=('any')
url='https://yarl.github.io/vicuna/'
license=('Apache')
depends=('java-runtime')
provides=('vicuna')
source=(
  "https://github.com/yarl/vicuna/releases/download/$pkgver/$_pkgname-$pkgver.zip"
  "https://raw.githubusercontent.com/yarl/vicuna/$pkgver/src/cuploader/resources/logo.png"
  "vicuna.desktop"
)

package() {
	cd "$srcdir"
  install -Dm644 "$_pkgname-$pkgver/$_pkgname.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -d "$pkgdir/usr/bin"
  echo -e "#!/bin/sh\nexec java -jar /usr/share/java/$_pkgname/$_pkgname.jar" '"$@"' > "$pkgdir/usr/bin/$_pkgname"
  chmod 755 "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 vicuna.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}

sha256sums=('534fdf699719d40a9c1c6edb41fa93bcbd1bb83be38e004c8afa8731a798f587'
            '6a9fa5bb5e7ef85b8db08560c7c4460e7ff4c15a9b97a016a10c867ba4ee4725'
            'bc6f47e7600117e859c7b7956e28959b03eb5dd8a8eff4318fb4047ecc7cfa42')
