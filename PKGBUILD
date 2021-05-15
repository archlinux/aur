# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# shellcheck disable=SC2034,SC2154
pkgname=pulseeffects-presets
_reponame="polybar-$pkgname" # expected to change
pkgver=0.2.1
pkgrel=1
pkgdesc='Control PulseAudio from the polybar status bar'
url="https://github.com/marioortizmanero/${_reponame}"
license=('custom:MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('e9442386844149553773db654221af76')
arch=('any')
depends=(
    'bash'
    'pulseeffects'
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
    install -D -m755 "./pulseeffects-presets.bash" "$pkgdir/usr/bin/$pkgname"
}
