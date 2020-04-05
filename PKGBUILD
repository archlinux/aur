# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=python-pg8000
pkgver=1.15.1
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url='https://github.com/tlocke/pg8000'
license=(BSD)
makedepends=(python-setuptools)
depends=(python python-scramp)
source=("https://files.pythonhosted.org/packages/source/p/pg8000/pg8000-$pkgver.tar.gz")
sha256sums=('01033498ffb27e780f6fb9ec877655ad97ceb26a50efdd77ca3b39ab2271f37c')

build() {
  cd pg8000-$pkgver
  python setup.py build
}

package() {
  cd pg8000-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
