# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# shellcheck disable=SC2034,SC2154
pkgname=polybar-easyeffects-presets
_reponame="polybar-$pkgname" # expected to change
pkgver=0.3.0
pkgrel=2
pkgdesc='Control EasyEffects from the polybar status bar'
url="https://github.com/marioortizmanero/${_reponame}"
license=('custom:MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('b1cb7cfe51f4f723c293273df2a9e3ee')
arch=('any')
depends=(
    'bash'
    'easyeffects'
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
    install -D -m755 "./easyeffects-presets.bash" "$pkgdir/usr/bin/$pkgname"
}
