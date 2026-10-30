# Maintainer: antiquete <antiquete@proton.me>

pkgname=opencode-sandbox-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Run OpenCode inside an isolated container (prebuilt release)"
arch=("x86_64")
url="https://github.com/Antiquete/opencode-sandbox"
license=("GPL-3.0-or-later")
provides=("opencode-sandbox")
conflicts=("opencode-sandbox-git")
depends=("bash")
optdepends=("docker: Docker runtime" "podman: Podman runtime")
source=("opencode-sandbox-$pkgver.tar.gz::https://github.com/Antiquete/opencode-sandbox/releases/download/v$pkgver/opencode-sandbox-$pkgver.tar.gz")
sha256sums=("9c38bb475d056441b244d47f64af32eed883f60a8ea38d357d0b5e13251e4b8f")

package() {
    cd "$srcdir/opencode-sandbox-$pkgver"
    install -Dm755 opencode-sandbox "$pkgdir/usr/bin/opencode-sandbox"
    install -Dm755 opencode-project-init "$pkgdir/usr/bin/opencode-project-init"
    install -Dm755 build/opencode-guard "$pkgdir/usr/lib/opencode-sandbox/guard"
}