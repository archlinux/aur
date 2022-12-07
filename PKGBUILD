pkgname=esbuild-bin
pkgver=0.16.1
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

sha256sums_x86_64=('c95e9c0604d110c1bfdf7728aa752c70e71486073dcc6071e968084ca2405378')
sha256sums_i686=('6843a9a95857826d6198a1e5b3f32473cbb159cffc10a3782d00b6c016326c6c')
sha256sums_aarch64=('e8f73383a09c8127294397674a35f80743c24548d56c1c3349522571af74e9c0')
sha256sums_armv7h=('a2e3b00874602e92868bbf8fe3a0b71561c07ce34b6baff6b4f3631d0ea38a54')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
