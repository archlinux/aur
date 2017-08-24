# Maintainer: DATSD <DAStudio *dot* 71e6fd52 *at* gmail *dot* com>
_basename=da-exception
pkgname=${_basename}-git
pkgver=r10.a271289
pkgrel=1
pkgdesc='exception by DA'
arch=('any')
url='https://github.com/745275633/DA-exception'
license=('GPL')
depends=('boost')
makedepends=('git')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}")
source=("${_basename}::git+https://github.com/745275633/DA-exception.git")
sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_basename}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "${srcdir}/${_basename}"
  install -d "${pkgdir}/usr/include/DA"
  install -Dm644 "include/DA/exception.hpp" "${pkgdir}/usr/include/DA"
}
