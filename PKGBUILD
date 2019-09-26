# Maintainer Poscat <poscat@mail.poscat.moe>

pkgname=firefox-secure-proxy-git
pkgver=0.1.0
pkgrel=2
pkgdesc="Standalone wrapper for Firefox Secure Proxy"
arch=("x86_64")
url="https://github.com/Snawoot/firefox-secure-proxy"
license=("MIT")
makedepends=("git" "python-setuptools")
depends=("python-setuptools" "python-pyoidc" "python-defusedxml")
source=("${pkgname}-${pkgver}::git://github.com/Snawoot/firefox-secure-proxy.git")
noextract=()
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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

