# Maintainer: Antrax <fredcox at gmail dot com>
pkgname=confz
pkgver=2.1.0 
pkgrel=2
pkgdesc="Pydantic Config Management"
arch=('any')
url="https://github.com/Zuehlke/ConfZ.git"
license=('MIT')
depends=(
  'python'
  'python-pydantic'
  'python-pyaml'
  'python-dotenv'
  'python-toml'
)
makedepends=(
  'python-build' 
  'python-installer' 
  'python-wheel' 
  'python-setuptools'  
  'python-poetry' 
)

source=("https://files.pythonhosted.org/packages/54/74/b309e610116535c26524dd703eda583d58011de2e37832f1d6daf8e942bb/confz-2.1.0.tar.gz")
sha256sums=('9bba65610084c207fd054590d2179cf5c98f7943c921a7a211b91d71da966b2a') 

build() {
  cd "confz-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "confz-${pkgver}"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

