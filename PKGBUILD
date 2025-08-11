# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=modern-beep
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern Rust alternative to the classic \`beep\` command with support for notifications, webhooks, and remote audio playback"
# arch=('x86_64' 'aarch64')
arch=('x86_64')
url="https://github.com/skorotkiewicz/modern-beep"
license=('MIT')
depends=('glibc')
conflicts=('beep')
provides=('beep')
options=(!strip)
source_x86_64=("https://github.com/skorotkiewicz/modern-beep/releases/download/v${pkgver}/beep-linux-x86_64.tar.gz")
# source_aarch64=("")
sha256sums_x86_64=('SKIP')
# sha256sums_aarch64=('SKIP')

package() {
    # Extract the archive to the package directory
    cd "$srcdir"
    tar -xf "${srcdir}/beep-linux-x86_64.tar.gz" -C "$pkgdir"

    install -Dm755 "$srcdir/beep" "$pkgdir/usr/bin/beep"
}