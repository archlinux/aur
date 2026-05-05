# Maintainer: VanHoney-ltd <stygionevidencesystems@gmail.com>
pkgname=ionguard-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Real-time LAN device monitor with dark UI — NEMESIS ENGINE (prebuilt binary)"
arch=('x86_64')
url="https://github.com/VanHoney-ltd/ionguard"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'fping')
optdepends=('fping: for active network sweeps')
provides=('ionguard')
conflicts=('ionguard')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/ionguard-$pkgver-linux-amd64.tar.gz")
sha256sums=('e9ba6d3f5922f2c9cf7ff2b32e0392a3850c7704afc4faad543e58027a9a54fc')

package() {
    cd "$srcdir"
    install -Dm755 ionguard "$pkgdir/usr/bin/ionguard"
    install -Dm755 ionguard-core "$pkgdir/usr/bin/ionguard-core"
    install -Dm644 ionguard.desktop "$pkgdir/usr/share/applications/ionguard.desktop"
    install -Dm644 ionguard.png "$pkgdir/usr/share/pixmaps/ionguard.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
