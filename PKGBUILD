# Maintainer: Bogdan Tatarov <bogdan@tatarov.me>
pkgname=senpai-cli
_appname=senpai
_reponame=cli
pkgver=0.80b
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
sha256sums=('90e72c266fb3580508fdb0082d263311a97741ed4665055e245f8ae52b2b8dac')

build() {
    cd "${_reponame}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_reponame}-${pkgver}"
    python setup.py install --root="$pkgdir"
}
