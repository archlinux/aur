# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Thomas Hobson <thomas@hexf.me>
pkgname=python3-yamale
pkgver=4.0.2
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
sha256sums=('b61534d84ff20eae3a796bf206846f2f0871dcd5b45f6a81cc0105f2a9327e8a')

build() {
  cd Yamale-"$pkgver"
  python setup.py build
}

package() {
  cd Yamale-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
