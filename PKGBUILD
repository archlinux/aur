# Maintainer: Bogdan Tatarov <bogdan@tatarov.me>
pkgname=senpai-cli
_appname=senpai
_reponame=cli
pkgver=0.70b
pkgrel=1
pkgdesc='BashSenpai is a terminal assistant powered by ChatGPT.'
arch=('x86_64')
url='https://github.com/BashSenpai'
license=('Apache')
groups=()
depends=('python-requests' 'python-toml')
makedepends=('python-setuptools')
optdepends=()
provides=('senpai')
source=("https://github.com/BashSenpai/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('17f4c4b61f5d2959b8ae6a31b57e49cad5de2851667f7b3936147bd5f2bec1ac')

build() {
    cd "${_reponame}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_reponame}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
