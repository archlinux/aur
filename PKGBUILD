pkgname=esbuild-bin
pkgver=0.14.49
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
sha256sums=('e70863d25eb42009c13f2caa2932dbd2825c0b4a6e15b881ee411016a78633ca')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
