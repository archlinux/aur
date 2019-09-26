# Maintainer Poscat <poscat@mail.poscat.moe>

pkgname=firefox-secure-proxy-git
pkgver=2a20a99
pkgrel=1
pkgdesc="Standalone wrapper for Firefox Secure Proxy"
arch=("x86_64")
url="https://github.com/Snawoot/firefox-secure-proxy"
license=("MIT")
makedepends=("git" "python-setuptools")
depends=("python-setuptools" "python-pyoidc" "python-defusedxml")
source=("${pkgname}::git://github.com/Snawoot/firefox-secure-proxy.git")
noextract=()
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
    cd "${srcdir}/${pkgname}"
    git submodule update --init
}

build () {
    cd "${srcdir}/${pkgname}"
}

package () {
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}"
}


