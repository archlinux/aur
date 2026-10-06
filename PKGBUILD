# Maintainer: antiquete <antiquete@proton.me>

pkgname=opencode-sandbox-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Run OpenCode inside an isolated Docker sandbox (prebuilt release)"
arch=("x86_64")
url="https://github.com/Antiquete/opencode-sandbox"
license=("GPL-3.0-or-later")
provides=("opencode-sandbox")
conflicts=("opencode-sandbox-git")
depends=("bash" "docker")
source=("opencode-sandbox-$pkgver.tar.gz::https://github.com/Antiquete/opencode-sandbox/releases/download/v$pkgver/opencode-sandbox-$pkgver.tar.gz")
sha256sums=("9bc3a1c9ec9478abb0221eac1b6c19ebd103bb15c87031fe9611d0f7118c0338")

package() {
    cd "$srcdir/opencode-sandbox-$pkgver"
    install -Dm755 opencode-sandbox "$pkgdir/usr/bin/opencode-sandbox"
    install -Dm755 opencode-project-init "$pkgdir/usr/bin/opencode-project-init"
    install -Dm755 build/opencode-guard "$pkgdir/usr/lib/opencode-sandbox/guard"
}