# Maintainer: Kim Scarborough <kim@scarborough.kim>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-rplcd
_pkgname=RPLCD
pkgver=1.4.0
pkgrel=1
pkgdesc="LCD library for the widely used Hitachi HD44780 controller"
arch=(any)
url='https://github.com/dbrgn/RPLCD'
license=('MIT')
depends=('python' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dbrgn/RPLCD/archive/v${pkgver}.tar.gz")
sha512sums=('0bd30f31a4c635da5408af6aaef4f4cd887280218dffa7714f945c0d292a0d844ab758dc75278bf805886cecb813bfa71e0811cab1b18a5b8cafdb432d64460b')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
