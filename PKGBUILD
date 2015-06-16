# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Adrián Pérez de Castro <aperez@igalia.com>

pkgname='sile-git'
pkgdesc='Modern typesetting system inspired by TeX'
pkgver='0.9.2'
_branch='master'
pkgrel='1'
arch='any'
url='http://www.sile-typesetter.org/'
license='MIT'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/simoncozens/${pkgname%-git}.git#branch=${_branch}")
sha512sums=('SKIP')
depends=('lua-lpeg'
         'lua-expat'
         'harfbuzz')

prepare () {
    cd "${pkgname%-git}"
    ./bootstrap.sh
}

build () {
    cd "${pkgname%-git}"
    ./configure
    make
}

package () {
    cd "${pkgname%-git}"
    make install DESTDIR="${pkgdir}/"
}
