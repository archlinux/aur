# Maintainer: Wojciech Kwolek <me@irth.pl>

_pkgname=plymouth-theme-aperture
pkgname="${_pkgname}-git"
pkgver=r1.edab46c
pkgrel=1
pkgdesc='Plymouth theme resembling the Portal loading screen.'
arch=('any')
url="https://github.com/irth/${_pkgname}/"
license=('MIT')
depends=('plymouth')
makedepends=('git')
source=("https://github.com/irth/${_pkgname}/archive/master.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${_pkgname}-master"

  _themedir="$pkgdir/usr/share/plymouth/themes/aperture"

  for N in img/*.png aperture.plymouth aperture.script; do
    install -Dm644 $N "${_themedir}/$N"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim:set ts=2 sw=2 et:
