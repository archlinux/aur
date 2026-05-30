# Maintainer: Volodymyr Vriukalo <vriukalovolodymyr æt protonmail-dot-com>
_pkgname=$'cdecl'
pkgname="${_pkgname}"-pjl
pkgver=18.7.2
pkgrel=1
pkgdesc="C declaration converter with improvements by Paul J. Lucas"
arch=('ppc' 'ppc64' 'i386' 'x86_64')
url="https://github.com/paul-j-lucas/cdecl"
license=('GPL3')
conflicts=("${_pkgname}" "${pkgname}-git")  # not a typo
provides=("${_pkgname}=${pkgver}-${pkgrel}")
depends=()
makedepends=('autoconf' 'automake' 'm4' 'libtool' 'flex' 'bison' 'git')

_source_tag="${_pkgname}-${pkgver}"
source=("${_pkgname}::git+https://github.com/paul-j-lucas/${_pkgname}.git#tag=${_source_tag}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
