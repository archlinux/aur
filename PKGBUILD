# Maintainer: antiquete <antiquete@proton.me>

pkgname=opencode-sandbox-bin
pkgver=1.9.1
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
sha256sums=("28e3261c22d8f947da02199dadb1f874cac0cb741be744cb464dc214b6057600")

package() {
    cd "$srcdir/opencode-sandbox-$pkgver"
    install -Dm755 opencode-sandbox "$pkgdir/usr/bin/opencode-sandbox"
    install -Dm755 opencode-project-init "$pkgdir/usr/bin/opencode-project-init"
    install -Dm755 build/opencode-guard "$pkgdir/usr/lib/opencode-sandbox/guard"
}
