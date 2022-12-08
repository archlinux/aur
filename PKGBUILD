pkgname=esbuild-bin
pkgver=0.16.3
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

sha256sums_x86_64=('fc2ecc2f89d1e98a776ce3fdf349811f43a543b5fb9bb438e6071b9cfba99fc9')
sha256sums_i686=('45b1d14731ef8cf5f12aee52dea70de85a5673e68a444ef6249455e422f04ff0')
sha256sums_aarch64=('424d93d7edc440a2f5a9259b4a0eae4ad82c925b8c0a6846940444ef610257ff')
sha256sums_armv7h=('fd76cd68161cecc9d34b64009c87c61c9b194e7ae82321db80788ac984923e1d')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
