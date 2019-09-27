# Maintainer: Rafał Kozdrój <kozeid2+aur@gmail.com>
_gitname=cascadia-code
_pkgname=ttf-${_gitname}
pkgname=${_pkgname}-git
pkgver=1909.16.r9.g93d0c1f
pkgrel=1
pkgdesc="A fun, new monospaced font that includes programming ligatures."
url="https://github.com/microsoft/${_gitname}"
arch=('any')
license=('custom')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"
  install -Dm644 CascadiaCode-Regular-VTT.ttf "${pkgdir}/usr/share/fonts/TTF/Cascadia.ttf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
