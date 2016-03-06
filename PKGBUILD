# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=vicuna-bin
_pkgname=vicuna
pkgver=1.23
pkgrel=1
pkgdesc='Tool for uploading files to Wikimedia Commons and other Wikimedia projects'
arch=('any')
url='https://yarl.github.io/vicuna/'
license=('Apache')
depends=('java-runtime')
provides=('vicuna')
source=(
  "https://github.com/yarl/vicuna/releases/download/$pkgver/$_pkgname-$pkgver.zip"
  "https://github.com/yarl/vicuna/blob/$pkgver/src/cuploader/resources/logo.png"
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

sha1sums=('ca090250ba28b974b859827bcb483c990402e9ef'
          'e09ef835bd8ede337fce3ed2c0771f1ab1c2931f'
          'd35fe4a344b56af3f4944486f59583cb39db1dab')
sha256sums=('534fdf699719d40a9c1c6edb41fa93bcbd1bb83be38e004c8afa8731a798f587'
            'e860dfc7ccb468b9ccbf1c941364f24080dff1c93b9e51ff98c1378b051708c6'
            'bc6f47e7600117e859c7b7956e28959b03eb5dd8a8eff4318fb4047ecc7cfa42')
sha512sums=('bf67c58ccd85c884b3cc6b748fc2e7f0a072d151029e43ae2de2e684dde05457d2dced8b753865e5c4758192a04496e07551f4369923df20185c1cb365c60ae5'
            '63669723d7db617732817d70b3085752f51990a939ba16c43169dc13787fa0a1570596d651bd831ea90144f406e164a5b4483065e6776fd23de44cc3d39bebec'
            'df7c08ad4f7b7fe693addb22a279ae8f6c2829dd465450e0daf4a7404baaa0f08445d6cdc8c81360aadef7b149b2d1ba817318b34ec62adc1006050fb8c9caeb')
