# Maintainer: <your AUR username>

pkgname=opencode-sandbox-git
pkgver=1.4.2
pkgrel=1
pkgdesc="Run OpenCode inside an isolated Docker sandbox (git master)"
arch=("any")
url="https://github.com/Antiquete/opencode-sandbox"
license=("GPL-3.0-or-later")
depends=("bash" "docker")
makedepends=("git")
source=("opencode-sandbox::git+https://github.com/Antiquete/opencode-sandbox.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/opencode-sandbox"
    git describe --always --tags --dirty | sed 's/^v//; s/-/./g'
}

package() {
    cd "$srcdir/opencode-sandbox"
    install -Dm755 opencode-sandbox "$pkgdir/usr/bin/opencode-sandbox"
    install -Dm755 opencode-project-init "$pkgdir/usr/bin/opencode-project-init"
}