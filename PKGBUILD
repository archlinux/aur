# Maintainer: Bogdan Tatarov <bogdan@tatarov.me>
pkgname=senpai-cli
_appname=senpai
_reponame=cli
pkgver=0.77b
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
sha256sums=('73f8f8c6f79de420c58f441051f6825b2103b5f8ab37b5cef2722b778cce9f68')

build() {
    cd "${_reponame}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_reponame}-${pkgver}"
    python setup.py install --root="$pkgdir"
}
