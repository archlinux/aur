# Maintainer: Florian B <gn0mish [at] protonmail [dot] com>

pkgname='pxltrm-git'
_pkgname='pxltrm'
pkgver=r76.6ecb1c7
pkgrel=1
pkgdesc='A pixel art editor inside the terminal.'
arch=('any')
_giturl='://github.com/dylanaraps/pxltrm'
url="https${_giturl}"
license=('MIT')
provides=("${_pkgname}")
depends=("bash")
source=("git${_giturl}.git")
md5sums=("SKIP")
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/"${_pkgname}"
  install -D -m755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
