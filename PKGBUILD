# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='konsave'
pkgname=('konsave')
pkgver='1.0.7'
pkgrel=1
pkgdesc="A CLI program that will let you save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/chakki-works/seqeval"
depends=('python' 'python-pyaml')
makedepends=('python' 'python-setuptools')
license=('GPL3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Prayag2/konsave/archive/v$pkgver.tar.gz")


prepare() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py build
}

# check() {
#     cd "${srcdir}/${pkgbase}-${pkgver}"
#     python setup.py pytest
# }

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}


md5sums=('732a0dcad9ee5fb005744db94d533344')
