pkgname=esbuild-bin
pkgver=0.16.2
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

sha256sums_x86_64=('b06b5a2d727ea365e9275c168416531ea06d85d06e20b1b2f65df7d6c30ca62c')
sha256sums_i686=('22d61e1b3d97d7f43f0cf57e36e0e9c4da9c582eb0cbc3abc46d27313e962676')
sha256sums_aarch64=('c88d7c7f182c69f82cd09094aab3822fb2e13d4beaaf4e5d7c4dc04361287377')
sha256sums_armv7h=('8c3977f936139ace69b989d9cfd77565a98822a3afa8a5d2bdf66c625d638d56')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "package/bin/${_name}"
}
