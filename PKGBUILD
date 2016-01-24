# Maintainer: Tom Willemse <tom@ryuslash.org>

python=python
name=wdocker

pkgname=$python-wdocker
pkgver=0.2.0
pkgrel=1
pkgdesc="Define docker commands in your Dockerfile"
depends=('python')
arch=('any')
source=(http://pypi.python.org/packages/source/w/wdocker/$name-$pkgver.tar.gz)
md5sums=('d873202d66b1d99a13004009e9f36d25')
url="https://pypi.python.org/pypi/wdocker"
license=("custom:ISC")

build() {
    cd "${srcdir}/${name}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${name}-${pkgver}"
    python setup.py install --root="$pkgdir"

    install -Dm644 "${srcdir}/${name}-${pkgver}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${name}-${pkgver}/README.rst" \
            "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
