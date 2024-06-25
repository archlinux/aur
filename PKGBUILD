# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname=python-casefy
_pkgname=${pkgname#python-}
pkgver=0.1.2
pkgrel=2
pkgdesc='Utilities to convert the case of strings'
arch=('any')
url='https://pypi.org/project/casefy'
license=('MIT')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/f1/5d/18597c7d3fe1ba70f5a228aa96b45d518028f2859f1b43a502ac283ef3e5/casefy-0.1.2.tar.gz")
sha256sums=('38a10846bf1b856c9df4cc411d13735d2b688f335e7714cc8dd4b5d8483a52dd')


_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"
  python setup.py build
}

package() {
  cd "$_archive"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

