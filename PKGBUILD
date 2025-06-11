# Maintainer: Ethan Smith <ethansmith.dev@gmail.com>

pkgname="python-attrs-git"
pkgver="25.3.0"
_pypkgname="attrs"
_pkgname="${_pypkgname}-${pkgver}"

pkgrel="1"
pkgdesc="helps you to write concise and correct software without slowing down your code."
arch=("any")
url="https://www.attrs.org/en/stable/"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("python-attrs")
provides=("python-attrs")
source=("https://github.com/python-attrs/attrs/archive/refs/tags/25.3.0.tar.gz")
sha256sums=("1116ff6fff7a79c8de6115e38532daa2507dfffeabd6bbc364d1d441fb14d00f")

build() {
    cd "${srcdir}/${_pkgname}" || return
        python -m build
}

package() {
    cd "${srcdir}/${_pkgname}" || return
        python -m installer --prefix=/usr \
                            --destdir="${pkgdir}" \
                            "${srcdir}/${_pkgname}/dist/${_pkgname}-py3-none-any.whl"
}