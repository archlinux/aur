# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Szymon Scholz <first name last name [at] gmail [dot] com>

pkgname=emulsion-bin
_name="${pkgname%-bin}"
pkgver=9.0
pkgrel=3
pkgdesc="A fast and minimalistic image viewer (binary release)"
arch=('x86_64')
url="https://arturkovacs.github.io/emulsion-website"
license=('MIT')
depends=('gcc-libs')
optdepends=('hicolor-icon-theme')
provides=("$_name")
conflicts=("$_name")
options=(!emptydirs)
source=("$_name-$pkgver.deb::https://github.com/arturkovacs/emulsion/releases/download/v$pkgver/Emulsion-Linux.deb-v$pkgver.deb")
sha256sums=('f66ab3b655af4da6e4c3fb60540c241cc9e7055ab70a0638aedd8af484d90427')

package() {
  tar -C "${pkgdir}" -xf data.tar.gz
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/lib/$_name/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/"
  chown -R root:root "$pkgdir/"
}
