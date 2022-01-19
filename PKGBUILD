# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=python-hass-data-detective
_name='HASS-data-detective'
pkgdesc="Set of convenience functions to analyse the data in your Home Assistant database"
pkgver=2.4
pkgrel=2
url="https://github.com/robmarkcole/HASS-data-detective"
license=('MIT')
arch=('any')
depends=('jupyter-notebook'
         'python-ruamel-yaml')
source=("https://github.com/robmarkcole/HASS-data-detective/archive/v$pkgver.tar.gz")
sha256sums=('e4cda934120fc4bca21edcb4e9fd98a0a4fa5d6bac3e12112bebfe0be9d96b17')

build() {
  cd ${srcdir}/${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_name}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

