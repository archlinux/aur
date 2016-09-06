# Maintainer: Rene Hahne <rehahne@gmail.com>

_pkgname=izulu
pkgname=${_pkgname}-git
pkgver=1.0.1
pkgrel=1
pkgdesc='weather aware desktop background images'
arch=('any')
url='https://github.com/onli/izulu'
license=('GPL')
depends=( 'bash' 'imagemagick' 'perl-xml-twig' 'bc' 'jq' )
makedepends=( 'git' )
source=("${_pkgname}::git+https://github.com/onli/izulu.git")
sha1sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    _ver=${pkgver}".$(git rev-parse --short HEAD)"
    echo "${_ver}"
}

build() {
	cd ${_pkgname}
    make
}

package() {
	cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
