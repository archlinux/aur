_pkgname=gitell
pkgname="${_pkgname}-git"
pkgver=0.1.r0.gc200ab3
pkgrel=2
pkgdesc="Quickly get multiple git repositories status"
arch=('any')
url="https://github.com/deadc0de6/gitell"
license=('GPL')
groups=()
depends=('bash')
makedepends=('git')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://github.com/deadc0de6/gitell.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
  install -D -m 755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}


