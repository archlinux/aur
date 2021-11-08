# Maintainer: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=python2-click
_realname=click
pkgver=7.1.2
pkgrel=1
pkgdesc="A simple wrapper around optparse for powerful command line utilities"
arch=("any")
url="http://click.pocoo.org/"
license=("BSD")
depends=("python2")
makedepends=("python2-setuptools")
source=("https://github.com/pallets/click/archive/${pkgver}/$pkgname-$pkgver.tar.gz")
sha512sums=('d0caf2fb0a258774a18a7b8f83bdfa73abeb70196a70b45a6cc35befaeb862d068d2f2cce4e27201ab2e3adcd02e7e2f099d6c37c497a507010eefa10ad16eba')

build() {
    cd "${srcdir}/${_realname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_realname}-${pkgver}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}
