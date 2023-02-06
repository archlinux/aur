_name=esbuild
pkgname=${_name}-bin
pkgver=0.17.6
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://${_name}.github.io"
license=('MIT')
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

sha256sums_x86_64=('c8792acf66fbf443127485d28a9b2903963958400b2ca5839298535f4cd9e764')
sha256sums_i686=('e796ed2fb0bf938a2220a84191e25ed89da2354e857bd5bfb0c555ff508b86b2')
sha256sums_aarch64=('561816ed05683ba861b6df9c7ecde5f043a03b74748cbf01e8990e79447a9b8c')
sha256sums_armv7h=('fb2bdbf1da60fd3cf02c8f46559a2b11bc1a347f9cb4f41c9debdf54cb45e150')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
