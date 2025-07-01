# Maintainer: Flack74 <puspendrachawlax@gmail.com>

pkgname=pom
pkgver=2.1.5
pkgrel=1
pkgdesc="Advanced Pomodoro timer with CLI and Web UI, featuring AI insights, multi-profiles, and plugin system."
arch=("x86_64")
url="https://github.com/Flack74/pom"
license=("MIT")
optdepends=("pulseaudio: for sound notifications"
            "pipewire-pulse: for sound notifications (pipewire users)")
makedepends=("go" "git")
source=("git+https://github.com/Flack74/pom.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/pom"
    export CGO_ENABLED=0
    export GO111MODULE=on
    go build -ldflags "-s -w" -o pom .
}

package() {
    cd "$srcdir/pom"
    install -Dm755 pom "$pkgdir/usr/bin/pom"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
