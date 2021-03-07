# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgbase='konsave'
pkgname=('konsave')
pkgver='1.1.3'
pkgrel=3
pkgdesc="A CLI program that will let you save and apply your KDE Plasma customizations with just one command!"
url="https://github.com/Prayag2/konsave"
depends=('python' 'python-pyaml')
makedepends=('python-setuptools-scm')
license=('GPL3')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Prayag2/konsave/archive/v$pkgver.tar.gz")
md5sums=("SKIP")

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



