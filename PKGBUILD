# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-axelrod')
pkgver=4.4.0
pkgrel=1
pkgdesc="Research tool for the Iterated Prisoner's Dilemma"
arch=('any')
url='https://github.com/Axelrod-Python/Axelrod'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-dask'
         'python-matplotlib' 'python-numpy' 'python-pandas'
         'python-prompt_toolkit' 'python-scipy'
         'python-tqdm')
options=(!emptydirs)
sha256sums=('1f8f8386ab292877e9c063aa371e0d5709a969cce9cba828ee95567be1858c7e')
source=("$url/archive/v$pkgver.tar.gz")

prepare() {
  # Avoid installing optional/unrequired dependencies
  echo > "$srcdir/Axelrod-$pkgver/requirements.txt"
}

package() {
  cd "$srcdir/Axelrod-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
