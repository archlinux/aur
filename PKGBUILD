# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=python3-yamale
pkgver=6.1.0 # renovate: datasource=github-releases depName=23andMe/Yamale
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
sha256sums=('715fa04a3da0b8f69b62bc9537c2eb0573711c56e766c233c7cee74b941a5964')

build() {
  cd Yamale-"$pkgver"
  python setup.py build
}

package() {
  cd Yamale-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
