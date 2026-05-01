# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
# Contributor: Damglador <vse.stopchanskyi@gmail.com>
# Modified from <https://aur.archlinux.org/packages/vscodium-xdg-dir-patch>, which released under the GPL-3.0-only license.
pkgname=code-xdg-dir-patch
pkgver=1.0.0
pkgrel=1
pkgdesc="Patch for Code to store data in ~/.local/share/"
arch=(any)
license=('GPL-3.0-only')
depends=(
    code
    bash
)
install=post.install
source=(
    code-xdg-dir-patch.sh
    code-xdg-dir-patch.hook
)
sha256sums=(
    1be05776ec5e8da0e932ca0e54d6c2a21786c5227ea4751e503ba19d7831efa4
    91144ebc95ea9e767b3a08ac1b66e7bd36c7c9a310fcd13e104f9ac8050e4165
)

package() {
    install -Dm 644 code-xdg-dir-patch.hook \
        "$pkgdir/usr/share/libalpm/hooks/code-xdg-dir-patch.hook"
    install -Dm 755 code-xdg-dir-patch.sh \
        "$pkgdir"/usr/bin/code-xdg-dir-patch
}
