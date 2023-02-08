# Maintainer: Dennis Stengele <dennis@schuppentier.org>
# Maintainer:zxp19821005 <zxp19821005 at 163 dot com>
pkgname=confluence-companion-app-for-linux
pkgver=1.0
pkgrel=1
pkgdesc=""
arch=(any)
url="https://github.com/zxp19821005/Companion4Linux"
license=('GPL')
depends=(python-websockets python-pyinotify python-wxpython libblockdev )
optdepends=(python-requests xapp libgexiv2 gst-python gedit)
conflicts=(confluence-companion-linux)
provides=(confluence-companion)
install=confluence-companion-app-for-linux.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/zxp19821005/Companion4Linux/archive/refs/tags/v${pkgver}.tar.gz"
        "confluence-companion-app-for-linux.service"
        "confluence-companion-app-for-linux.install")
sha256sums=('2dfbf5ca459d0c316365986c92661bec9f1a625909c8ec638ebb1f2380742bd5'
            '16d28748e74766ace4dc95045744dc5e53d750529ca48e6fbe2971a207dbbe16'
            '65ac8817093a1af0efe66f58129a79989c18e57f47cfa07c3b8ac02a0660d489')

package() {
    cd Companion4Linux-1.0
    install -Dm755 companion.py "$pkgdir/usr/bin/companion.py"
    install -Dm755 companion2.py "$pkgdir/usr/bin/companion2.py"

    install -Dm755 companion-protocol-handler.desktop "$pkgdir/usr/share/applications/companion-protocol-handler.desktop"

    install -Dm644 "$srcdir/confluence-companion-app-for-linux.service" "$pkgdir/usr/lib/systemd/user/confluence-companion-app-for-linux.service"
}
