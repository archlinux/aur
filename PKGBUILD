pkgname=esbuild-bin
pkgver=0.15.17
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

sha256sums_x86_64=('4a8bad6e2d13e7edfef1351e4725f65a8828093b0d63bba3237fcab5e530afa2')
sha256sums_i686=('fa0bd44fb7d6cfd789a02b096a4be967bdd3b90fa3238f084965164c8c18c865')
sha256sums_aarch64=('893fb422f0c2759998a125cb23c3055712d5f3f4414ca75f3ec9dd55b03fcc8c')
sha256sums_armv7h=('36f47e4cb59ce4608e9030993869481901d57cb85923a4c97170465a1bc3f720')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
