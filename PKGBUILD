# Maintainer: Landon Buttars <buttars0070@gmail.com>

pkgname=python-gorilla-cli
pkgver=0.0.9
pkgrel=1
pkgdesc="LLMs for your CLI"
arch=('any')
url="https://github.com/gorilla-llm/gorilla-cli"
license=('Apache')
depends=('python' 'python-requests' 'python-halo' 'python-prompt_toolkit')
makedepends=('python-setuptools')
source=("https://github.com/gorilla-llm/gorilla-cli/archive/refs/tags/$pkgver.zip")
sha256sums=('cf7e92fd8f16f6a1801e557fc752d2c6c90e1cf93c59b54bc5d071e444a88e0b')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

