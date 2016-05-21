# Maintainer: Anton Batenev <antonbatenev@yandex.ru>

pkgname=python2-toxcore
pkgver=0.2.1
pkgrel=1
pkgdesc="Python binding for ToxCore"
arch=('i686' 'x86_64')
url="https://github.com/abbat/pytoxcore"
license=('GPL-3')
depends=('python2' 'toxcore')
makedepends=('git' 'python2' 'toxcore')
source=("git+https://github.com/abbat/pytoxcore.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/pytoxcore"

    python2 setup.py build
}

package() {
    cd "${srcdir}/pytoxcore"

    python2 setup.py install --root=${pkgdir}/ --optimize=1

    install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}"

    install -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
