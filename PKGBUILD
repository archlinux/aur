# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=pulseaudio-control
_reponame="polybar-$pkgname" # expected to change
pkgver=3.0.0
pkgrel=1
pkgdesc='Easily control PulseAudio from any status bar'
url="https://github.com/marioortizmanero/${_reponame}"
license=('custom:MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('31952df637b6591736749b83aab8c6ee')
arch=('any')
depends=(
    'bash'
    'libpulse'
    'pulseaudio'
)
optdepends=(
)
conflicts=(
)

package() {
    set -e
    cd "${_reponame}-$pkgver"

    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 "./pulseaudio-control.bash" "$pkgdir/usr/bin/$pkgname"
}

