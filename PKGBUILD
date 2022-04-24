# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
_name=Red-Commons
pkgname='python-red-commons'
pkgver=1.0.0
pkgrel=1
pkgdesc="Common utilities used by multiple projects maintained by Cog Creators."
url="https://github.com/Cog-Creators/Red-Commons"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('b9bcc55c72801c33eb0c77aaf48041d018bfb5f1293053cff8a3e10e4d33e52d')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
