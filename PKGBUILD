# Maintainer: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>
_pkgname="llm"
pkgname="${_pkgname}-bin"
pkgver=0.1.1
pkgrel=4
pkgdesc='Run inference for Large Language Models on CPU, with Rust 🦀🚀🦙'
arch=('x86_64')
url="https://github.com/rustformers/llm"
license=('MIT' 'APACHE')
depends=(glibc gcc-libs)
provides=('llm')
conflicts=('llm')
_tarname="${_pkgname}-cli-${arch}-unknown-linux-gnu"
source=("${_pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_tarname}.tar.xz")
sha256sums=('bc373197995c6a000fd5fe92a9286d88f0f8387f8cd6239f93f8921bfbeae8e7')

build () {
    cd "${srcdir}/${_tarname}"
    cat LICENSE-* > LICENSE
}

package() {
    cd "${srcdir}/${_tarname}"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
