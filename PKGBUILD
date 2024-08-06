# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=pulseaudio-control
_reponame="polybar-$pkgname" # expected to change
pkgver=3.1.1
pkgrel=2
pkgdesc='Easily control PulseAudio from any status bar'
url="https://github.com/marioortizmanero/${_reponame}"
license=('custom:MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('7724c5f396b5ec8a9a62743ee14044fa')
arch=('any')
depends=(
    'bash'
    'libpulse'
    'pulse-native-provider'
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

