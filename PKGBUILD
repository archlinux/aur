pkgname=esbuild-bin
pkgver=0.16.4
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

sha256sums_x86_64=('6c7845ff4eeb7c5887be4d65a963b7ef0b64a0b8b32941c31c0804bcb9b23a8d')
sha256sums_i686=('52daa9f4a62604ee5b3d9ca36e4c9415468b5434b3c6661a30a2bdf0a1f3f406')
sha256sums_aarch64=('43234c98fbb85335e42c3103863c6c3a506d39f30a2b03c713c269c88d1ac18e')
sha256sums_armv7h=('7344d34ff82e49779b356234f27fe2d5991d892e68ea398720620a6a57a9e462')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
