# Maintainer: sand <https://github.com/sandangel/sand-lxqt-theme/tree/master>
_pkgname=sand
pkgname=sand-lxqt-theme
pkgver=1.0
pkgrel=1
pkgdesc="Dark theme for the LXQt Desktop, color scheme for qterminal, lxqt-panel, mixed between breeze and ambiance"
arch=('any')
url="https://github.com/sandangel/sand-lxqt-theme"
license=('custom:sand')

depends=('')
makedepends=('git')
optdepends=('breeze-icons: Breeze icon themes')

source=("https://github.com/sandangel/sand-lxqt-theme/raw/master/archive/${_pkgname}-${pkgver}.tar.xz")

md5sums=('544c45ad7f2f9eedd8ef248a29d10168')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -dm 755 "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
  install -dm 755 "${pkgdir}"/usr/share/color-schemes
  install -dm 755 "${pkgdir}"/usr/share/qtermwidget5/color-schemes
  cp -a --no-preserve='ownership' * "${pkgdir}"/usr/share/lxqt/themes/${_pkgname}
  mv "${pkgdir}"/usr/share/lxqt/themes/"${_pkgname}"/Sand.colors "${pkgdir}"/usr/share/color-schemes
  mv "${pkgdir}"/usr/share/lxqt/themes/"${_pkgname}"/Sand.colorscheme "${pkgdir}"/usr/share/qtermwidget5/color-schemes/

}
