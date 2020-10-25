# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Maintainer: Oliver Ford <dev.aur@ojford.com>
# shellcheck disable=SC2034,SC2154
pkgname=pulseaudio-control
_reponame="polybar-$pkgname" # expected to change
pkgver=2.0
pkgrel=1
pkgdesc='Control PulseAudio from the polybar status bar'
url="https://github.com/marioortizmanero/${_reponame}"
license=('custom:MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('c806b6ea0d30079dd1f6f2c4a659ddca')
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

