# Maintainer: JunYoung Gwak <aur@jgwak.com>

_pkgname=openai-cli
pkgname="python-${_pkgname}"
pkgver=0.0.3
pkgrel=1
pkgdesc="OpenAI command-line client"
url="https://github.com/peterdemin/openai-cli"
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e88042874b26e960cac385eb11be2b08')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
