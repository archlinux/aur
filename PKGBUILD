# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-pyuca
pkgver=1.2
pkgrel=2
pkgdesc='Python implementation of the Unicode Collation Algorithm (UCA)'
arch=('any')
url='https://github.com/jtauber/pyuca'
license=('MIT' 'custom')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41a47aa598c152a52b1dc4aa210c6db62cc7f72d13cee2caee80841c3cc49e19')

build() {
    cd pyuca-$pkgver
    python setup.py build
}

package() {
    cd pyuca-$pkgver
    python setup.py install --root "${pkgdir}" --optimize=1
    install -Dm644 "${srcdir}"/pyuca-$pkgver/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
    echo '' >> "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
    cat "${srcdir}"/pyuca-$pkgver/LICENSE-allkeys >> "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
