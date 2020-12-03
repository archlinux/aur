# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

_name=geomet
pkgname=python-geomet
pkgver=0.2.1.post1
pkgrel=1
pkgdesc="GeoMet - Convert GeoJSON to WKT/WKB, and vice versa."
arch=('any')
url="https://pysal.org/libpysal"
license=('Apache')
depends=('python-click' 'python-six')
optdepends=(
  'python-nose: tests'
  'python-coverage: tests'
  'flake8: tests'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('91d754f7c298cbfcabd3befdb69c641c27fe75e808b27aa55028605761d17e95')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/usr/LICENSE"
}
