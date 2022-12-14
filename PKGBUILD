pkgname=esbuild-bin
pkgver=0.16.6
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-*}"
provides=("${_name}")
conflicts=("${_name}")

_get_source() {
    local npmpkg="linux-$1"
    local archive="${npmpkg}-${pkgver}.tgz"
    echo "${_name}-${archive}::https://registry.npmjs.org/@${_name}/${npmpkg}/-/${archive}"
}

source_x86_64=("$(_get_source x64)")
source_i686=("$(_get_source ia32)")
source_aarch64=("$(_get_source arm64)")
source_armv7h=("$(_get_source arm)")

sha256sums_x86_64=('d82ff5cdb1a8dee8f87bc025948ced5343798cf3db29888bb6179bb400039ad8')
sha256sums_i686=('751ab8ac4a43e4a4742f0843eed830bad4c01709effcc98d0e8976e815d1d5cd')
sha256sums_aarch64=('b311b42a162f8b49875aa13270d592f032506282c7313dcf68567930a5c52882')
sha256sums_armv7h=('34abf782ac477114db0be6f6e9600d072aaa81b2a52fd05ae5b0cc23abfefbbd')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
