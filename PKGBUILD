pkgname=esbuild-bin
pkgver=0.15.15
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-*}"
provides=("${_name}")
conflicts=("${_name}")

_get_source() {
    local npmpkg="${_name}-linux-$1"
    local archive="${npmpkg}-${pkgver}.tgz"
    echo "${archive}::https://registry.npmjs.org/${npmpkg}/-/${archive}"
}

source_x86_64=("$(_get_source 64)")
source_i686=("$(_get_source 32)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('f4294a0e3fe2649e1a473c75595b1224506376383499000487d8ab3b50daa3ee')
sha256sums_i686=('b5e2f37aa3eb12203baf6d072008fc4c89ae7667e480be4f9f1a1bbb27e7cf61')
sha256sums_aarch64=('2fecbc24a57ba1e018d41003f0c7cd4af4a3720a04f59591d69e815a88e07f58')
sha256sums_armv7h=('581d1e2044ce49309461e19cfa1cbbef73723eb095b2bc5f25fce9f040667db0')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
