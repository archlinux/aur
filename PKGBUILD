# Maintainer: David Naramski <david.naramski AT gmail.com>
pkgname=cadmelia
pkgver=0.4.0
pkgrel=1
pkgdesc=""
arch=(x86_64)
url=""
license=('European Union Public License')
groups=()
depends=('java-runtime=8')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('cadmelia.sh' 'logo.scad' 'https://github.com/naramski/cadmelia/releases/download/0.4.0/cadmelia-cli-0.4.0.jar')
noextract=("cadmelia-cli-0.4.0.jar" "cadmelia.sh" "logo.scad")
uncompress=
md5sums=('7c67466c99809710169e789fbec85a75'
         '344c3c61cd1771517c134b0e5697bd09'
         'ee09929bd7a49546d21a51ac4c8a5bdb')

package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib/cadmelia
  mkdir -p "$pkgdir"/usr/share/cadmelia

  install -Dm644 "$srcdir"/cadmelia-cli-"$pkgver".jar "$pkgdir"/usr/lib/cadmelia/cadmelia-cli-"$pkgver".jar
  install -Dm755 "$srcdir"/cadmelia.sh "$pkgdir"/usr/lib/cadmelia/cadmelia.sh
  install -Dm644 "$srcdir"/logo.scad "$pkgdir"/usr/share/cadmelia/logo.scad

  ln -sf "/usr/lib/cadmelia/cadmelia-cli-$pkgver.jar" "$pkgdir/usr/lib/cadmelia/cadmelia.jar"
  ln -sf "/usr/lib/cadmelia/cadmelia.sh" "$pkgdir/usr/bin/cadmelia"
}
