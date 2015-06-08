pkgname=('log4cplus-git')
srcname='log4cplus'
pkgver='r1'
pkgrel='1'
pkgdesc='Simple to use C++ logging API providing thread-safe, flexible, and arbitrarily granular control over log management and configuration'
arch=('i686' 'x86_64')
url='https://github.com/log4cplus/log4cplus'
license=('custom:BSD' 'Apache')

depends=('gcc-libs')
makedepends=('git' 'gcc-libs')
provides=('log4cplus')
conflicts=('log4cplus')

source=("${srcname}::git+https://github.com/log4cplus/log4cplus.git")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${srcname}"

    autoreconf --install

    ./configure \
        --prefix='/usr' \
        --with-working-locale
}

build() {
    cd "${srcdir}/${srcname}"

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install
}
