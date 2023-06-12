# Maintainer: Bogdan Tatarov <bogdan@tatarov.me>
pkgname=senpai-cli
_appname=senpai
_reponame=cli
pkgver=0.82b
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
sha256sums=('b96c30221d7f26a3c2f67612ac3726d71ab014828e5cb4af26376ad91b40f628')

build() {
    cd "${_reponame}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_reponame}-${pkgver}"
    python setup.py install --root="$pkgdir"
}
