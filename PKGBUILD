# Maintainer: Bogdan Tatarov <bogdan@tatarov.me>
pkgname=senpai-cli
_appname=senpai
_reponame=cli
pkgver=0.79b
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
sha256sums=('e156271bff8ff1a93a6a615bf14cf8b67e6d1850781f7c43cb0deb11ae2b0239')

build() {
    cd "${_reponame}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_reponame}-${pkgver}"
    python setup.py install --root="$pkgdir"
}
