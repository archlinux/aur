pkgname=python-labmaze
pkgver=1.0.6
pkgrel=1
pkgdesc="A standalone release of DeepMind Lab's maze generator with Python bindings"
url="https://github.com/deepmind/labmaze"
license=("Apache-2.0")
arch=('x86_64')
depends=('python' 'python-absl' 'python-numpy')
makedepends=('python-setuptools' 'bazel5')
source=("https://files.pythonhosted.org/packages/93/0a/139c4ae896b9413bd4ca69c62b08ee98dcfc78a9cbfdb7cadd0dce2ad31d/labmaze-1.0.6.tar.gz")
sha256sums=('2e8de7094042a77d6972f1965cf5c9e8f971f1b34d225752f343190a825ebe73')

build() {
    cd "${srcdir}/labmaze-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/labmaze-$pkgver"
    python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
