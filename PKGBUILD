# Maintainer: Dennis Stengele <dennis@schuppentier.org>
pkgname=confluence-companion-linux
pkgver=0.5
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/schorschii/companion-linux"
license=('GPL')
depends=(python-websockets python-distutils-extra python-pyinotify python-wxpython)
provides=(confluence-companion)
install=confluence-companion-linux.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/schorschii/companion-linux/archive/v${pkgver}.tar.gz"
        "confluence-companion.service")
sha256sums=('bd2d9e7031ec1618f26b5aca33dda79f5e483816c814d2e19e96e31601d85d09'
            'b1032345db6755f2217c4156cf7fd28b539947bd82ea9528f7592ef0447563f8')

package() {
    cd "companion-linux-$pkgver"
    install -Dm755 companion.py "$pkgdir/usr/bin/companion.py"
    install -Dm755 companion2.py "$pkgdir/usr/bin/companion2.py"

    install -Dm755 companion-protocol-handler.desktop "$pkgdir/usr/share/applications/companion-protocol-handler.desktop"

    install -Dm644 "$srcdir/confluence-companion.service" "$pkgdir/usr/lib/systemd/user/confluence-companion.service"
}
