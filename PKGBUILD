# Maintainer: noahlyk <noahlykins@gmail.com>
#
# The AUR package: the release binary, not a build from source. The release workflow bumps
# pkgver and pushes this folder to the AUR when the AUR_SSH_KEY secret is set.
pkgname=typeladder
pkgver=0.1.0
pkgrel=1
pkgdesc="Adaptive typing test: builds your vocabulary from the commonest word to the rarest, for any keyboard, steno engine or text expander"
arch=('x86_64' 'aarch64')
url="https://github.com/noahlyk/typeladder"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=()
optdepends=('espanso: a text expander the hooks can pause during a test'
            'keymux: a steno engine (the lyk theory exports its dictionary for typeladder)')
options=('!debug' '!lto')
install=typeladder.install

source=(
    "LICENSE::https://raw.githubusercontent.com/noahlyk/typeladder/v${pkgver}/LICENSE"
    "NOTICE::https://raw.githubusercontent.com/noahlyk/typeladder/v${pkgver}/NOTICE"
)
source_x86_64=("https://github.com/noahlyk/typeladder/releases/download/v${pkgver}/typeladder-${pkgver}-x86_64.tar.gz")
source_aarch64=("https://github.com/noahlyk/typeladder/releases/download/v${pkgver}/typeladder-${pkgver}-aarch64.tar.gz")
sha256sums=('SKIP' 'SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
noextract=()

package() {
    install -Dm755 "$srcdir/typeladder" "$pkgdir/usr/bin/typeladder"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/config.md" "$pkgdir/usr/share/doc/$pkgname/config.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
