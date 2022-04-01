# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: the NICOS contributors, MLZ

pkgname=nicos-pyctl
pkgver=1.2.0
pkgrel=1
pkgdesc="NICOS pyctl c module"
groups=('tango-controls')
arch=('x86_64' 'armv7h')
url="https://nicos-controls.org/"
license=('GPL3')
depends=('python')
conflicts=('nicos-pyctl-git')
provides=('python-lttb')
source=("https://github.com/mlz-ictrl/nicos-pyctl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93fc64901538ae1729fa0130e7227302d7645805848d8db37766f58ab57e4c2b')


build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  python setup.py check -mr
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root=$pkgdir/
}
