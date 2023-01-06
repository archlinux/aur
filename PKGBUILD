# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=emake-git
_pkgname=emake
pkgver=3.6.12.r73.7d7c8cb
_pkgver=3.6.12
pkgrel=1
pkgdesc='Yet the simplest build toolchain for gcc/clang projects'
arch=('any')
url='https://github.com/skywind3000/emake'
license=('GPL')
depends=(python)
makedepends=(git)
provides=(emake)
conflicts=(emake)
source=("${pkgname}::git+https://github.com/skywind3000/emake.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  _ver=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "${_pkgver}.${_ver}"
}

package() {
  cd "${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -rvf "${srcdir}/${pkgname}/sample" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
# vim:set ts=2 sw=2 et:
