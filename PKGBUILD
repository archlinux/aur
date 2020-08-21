# Maintainer: Thomas Hobson <thomas@hexf.me>
pkgname=python3-yamale
pkgver=3.0.2
pkgrel=1
epoch=0
source=('https://github.com/23andMe/Yamale/archive/a49760d57b94619543325b06582cfdf15772a26b.zip')
sha256sums=('da25f464f480402b97a37a838250a23b1402392c35dca97bdecbac78b0746eb4')
pkgdesc="YAML schema validator"
arch=('x86_64')
url="https://github.com/23andMe/Yamale"
license=('MIT')
depends=('python-pyaml' 'python')
optdepends=('python-ruamel-yaml')
makedepends=('python-setuptools')
provides=('yamale' 'python-yamale')
build() {
  cd $(dirname */setup.py)
  python setup.py build
}
package() {
  cd $(dirname */setup.py)
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}