# Maintainer: Thomas Hobson <thomas@hexf.me>
pkgname=python3-yamale
pkgver=2.0.1
pkgrel=1
epoch=0
pkgdesc="YAML schema validator"
arch=('x86_64')
url="https://github.com/23andMe/Yamale"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyaml' 'python')
optdepends=('python-ruamel-yaml')
provides=('yamale' 'python-yamale')
source=("https://github.com/23andMe/Yamale/archive/2.0.1.zip")
sha256sums=('53a2e3cc85487208d5f37314b49bb9920c5b349a6755da9fe08c5cef4b8b4690')

build() {
    cd Yamale-*/
    python setup.py build
}

package() {
    cd Yamale-*/
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}