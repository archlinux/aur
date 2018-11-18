# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=python-pg8000
pkgver=1.12.3
pkgrel=1
pkgdesc="Pure-Python PostgreSQL database driver, DB-API compatible"
arch=(any)
url='https://pythonhosted.org/pg8000/'
license=(BSD)
makedepends=(python-setuptools)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/p/pg8000/pg8000-$pkgver.tar.gz")
sha256sums=('18192d90409a3037619ef17f1924e3fd9c7169c9c1b3277cec1982116ec2b6de')

build() {
  cd pg8000-$pkgver
  python setup.py build
}

package() {
  cd pg8000-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
