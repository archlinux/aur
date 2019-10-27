# Maintainer Poscat <poscat@mail.poscat.moe>

pkgname="python-pyoidc"
pkgver="1.1.0"
pkgrel=1
pkgdesc="A complete OpenID Connect implementation in Python"
arch=("x86_64")
url="https://github.com/OpenIDC/pyoidc"
license=("Apache")
makedepends=("git" "python-setuptools")
depends=("python-beaker" "python-mako" "python-pyjwkest")
source=("${pkgname}-${pkgver}::git://github.com/OpenIDC/pyoidc.git#tag=v${pkgver}")
noextract=()
sha256sums=("SKIP")

prepare () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    git submodule update --init
}

build () {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

package () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}

