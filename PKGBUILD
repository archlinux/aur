pkgname=esbuild-bin
pkgver=0.15.3
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-bin}"
provides=("${_name}")
conflicts=("${_name}")

_npmpkg="${_name}-linux-64"
_archive="${_npmpkg}-${pkgver}.tgz"

source=("${_archive}::https://registry.npmjs.org/${_npmpkg}/-/${_archive}")
sha256sums=('bd21a47a58981b318462cd682767f6b8233ce1b7fc2cd98daad8ab2778a6ffe7')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
