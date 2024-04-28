# Maintainer: Bet4 <0xbet4@gmail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Thomas Hobson <thomas@hexf.me>
pkgname=python3-yamale
pkgver=5.2.0
pkgrel=1
pkgdesc='A schema and validator for YAML'
arch=('any')
url='https://github.com/23andMe/Yamale'
depends=('python-pyaml')
optdepends=('python-ruamel-yaml')
makedepends=('python-setuptools')
provides=('yamale' 'python-yamale')
license=('MIT')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('000affa9083b9c5ae71002185d822c8bd62a6d2928d0e82c63df5a65fbdea87d')

build() {
  cd Yamale-"$pkgver"
  python setup.py build
}

package() {
  cd Yamale-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
