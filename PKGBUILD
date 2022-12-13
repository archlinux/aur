pkgname=esbuild-bin
pkgver=0.16.5
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

sha256sums_x86_64=('307dc9c07c89b94c68680282df87debfd88aec48e97b490adb82719831ff86b7')
sha256sums_i686=('c76f2c05e64f3ad1f62a727f80733cc5e14075afcdb477650902a529240b9dd7')
sha256sums_aarch64=('613eb8ab6b6cdcf31a0c29799c1eba3166e1856fc1a37a4498fb5fca19bfe8e7')
sha256sums_armv7h=('4422dad13f1e8f83c0067549bd7bec2ef159c1cd42dd7945b1d644b58398efe2')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
