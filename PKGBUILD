# Maintainer: Ryan Gonzalez <rymg19@gmail.com>

pkgname='python-pytrec-eval'
pkgver=0.4
pkgrel=1
pkgdesc='The smartest command line arguments parser in the world'
arch=('any')
url='https://github.com/cvangysel/pytrec_eval'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gcc-libs')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/36/0a/5809ba805e62c98f81e19d6007132712945c78e7612c11f61bac76a25ba3/pytrec_eval-0.4.tar.gz")
sha256sums=('40b72e90f59751db3c7e385d3797849f6bc634ab07beb398b84301e925f54fb9')


build(){
    cd "pytrec_eval-${pkgver}"
    python setup.py build
}

package() {
    cd "pytrec_eval-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
