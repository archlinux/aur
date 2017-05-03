# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=all-the-icons.el
_pkgmaintainer=domtronn
_pkgdestdirname=all-the-icons
_versionprefix=
pkgver=2.5.2
pkgrel=1
pkgdesc="Icon font for all-the-icons.el (A utility package to collect various Icon Fonts and propertize them within Emacs.)"
pkgname=ttf-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('MIT')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('woff2-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('SKIP')
install=$pkgname.install

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/"
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 fonts/${_pkgdestdirname}.ttf "$pkgdir/usr/share/fonts/TTF/${_pkgdestdirname}.ttf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
