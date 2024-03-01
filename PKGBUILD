# Don't bump to 2.X until we have Anki >= 2.1.41
pkgname=python-mypy-protobuf
pkgver=3.5.0
pkgrel=1

pkgdesc='Generate mypy stub files from protobuf specs'
url='https://github.com/dropbox/mypy-protobuf'
arch=('any')
license=('Apache')

depends=('mypy' 'protobuf' 'python' 'python-protobuf')
makedepends=('python-build' 'python-installer' 'python-wheel')

source=("https://files.pythonhosted.org/packages/source/m/mypy-protobuf/mypy-protobuf-$pkgver.tar.gz")

sha256sums=('21f270da0a9792a9dac76b0df463c027e561664ab6973c59be4e4d064dfe67dc')

build() {
  cd mypy-protobuf-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd mypy-protobuf-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
