pkgname=esbuild-bin
pkgver=0.15.18
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

sha256sums_x86_64=('8fc71c83c5caeaf3b977508225dc3e0365cbc5f08d20119271713852f1b3de47')
sha256sums_i686=('df54f2df8baafcbbd30d760bc1e76d5cf0443759b6a297e793467f8d2d75f173')
sha256sums_aarch64=('6272000d69425f8e59935adccf2452ba053192d1627f98d426aab2b31c15f9e3')
sha256sums_armv7h=('d519db906f352792f3fe737a1b7905e295491a33cf3dee36f7300768fe1c3c2a')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
