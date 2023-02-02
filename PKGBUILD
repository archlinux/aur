_name=esbuild
pkgname=${_name}-bin
pkgver=0.17.5
pkgrel=2
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

sha256sums_x86_64=('c9ae89c52c2e476f08aa39911d79ebef26e170730005f91343887f542d2b632a')
sha256sums_i686=('cfd4114d3b9e2f0bcf8fd0f4c99300f6c0e96c8c2daf2a8defc33e475f796a58')
sha256sums_aarch64=('d55954ec89f49dab8948992a0fe4b82ce629df0d23ac9716451a2f662dd3ae0c')
sha256sums_armv7h=('c1b27a5b87a13bd57d756c9e909121d6f69e18c3c2a77afa2be8d5d7af841aeb')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
