# Maintainer: Kim Scarborough <kim@scarborough.kim>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-rplcd
_pkgname=RPLCD
pkgver=1.3.1
pkgrel=1
pkgdesc="LCD library for the widely used Hitachi HD44780 controller"
arch=(any)
url='https://github.com/dbrgn/RPLCD'
license=('MIT')
depends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dbrgn/RPLCD/archive/v${pkgver}.tar.gz")
sha512sums=('68fc57e3588b452ad8a1d7814db4e151109efaa48ab9d8b4bac1cdf27486dbc386466bc668616c3954c4303c412798f883ed2af0da0d2240deadd7b0f4127b59')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
