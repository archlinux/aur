# vim: set ts=4 sw=4 sts=4 et:
# Maintainer: Jeremy Asuncion <jeremyasuncion808@gmail.com>

_name=pawk
pkgname=python-pawk
pkgver=0.6
pkgrel=3
pkgdesc="A Python line-processor (like awk) based on pyline."
arch=('any')
url='https://github.com/alecthomas/pawk'
license=('PSF')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/ab/5a/c22c6ff37c74196950fad281b1094547e06065d5c922d8b679458e5f37b5/${_name}-${pkgver}.tar.gz")
md5sums=('d5fa14a9a18db14d426f040872b06b45')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}

