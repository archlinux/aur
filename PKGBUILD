# Maintainer: antiquete <antiquete@proton.me>

pkgname=opencode-sandbox-bin
pkgver=1.7.0
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
sha256sums=("c1dcc5b661000e6814b94a516dfe605d476ef6cc8910818a4bf0d5b9e73f4d40")

package() {
    cd "$srcdir/opencode-sandbox-$pkgver"
    install -Dm755 opencode-sandbox "$pkgdir/usr/bin/opencode-sandbox"
    install -Dm755 opencode-project-init "$pkgdir/usr/bin/opencode-project-init"
    install -Dm755 build/opencode-guard "$pkgdir/usr/lib/opencode-sandbox/guard"
}