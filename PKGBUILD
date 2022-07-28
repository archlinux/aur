# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Thomas Hobson <thomas@hexf.me>
pkgname=python3-yamale
pkgver=4.0.4
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
sha256sums=('3f0730006b72fbd9969ddc0da392a0210f6bcd60f5c5ae104fa4ed6cededbafb')

build() {
  cd Yamale-"$pkgver"
  python setup.py build
}

package() {
  cd Yamale-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
