# Maintainer: ml <>
# Contributor: Thomas Hobson <thomas@hexf.me>
pkgname=python3-yamale
pkgver=4.0.0
pkgrel=1
pkgdesc='A schema and validator for YAML'
arch=('x86_64')
url='https://github.com/23andMe/Yamale'
depends=('python-pyaml')
optdepends=('python-ruamel-yaml')
makedepends=('python-setuptools')
provides=('yamale' 'python-yamale')
license=('MIT')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('68bf20c6665e53271bdc39ecb3b73066edb5291b14a06cb3d835a2ec05a23d73')

build() {
  cd Yamale-"$pkgver"
  python setup.py build
}

package() {
  cd Yamale-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
