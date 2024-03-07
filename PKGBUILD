# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Thomas Hobson <thomas@hexf.me>
pkgname=python3-yamale
pkgver=5.0.0
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
sha256sums=('d5c8b5d9e1c39195033d679122e6b44ea0a99f97a8786f8fafccbcf8a90947ff')

build() {
  cd Yamale-"$pkgver"
  python setup.py build
}

package() {
  cd Yamale-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
