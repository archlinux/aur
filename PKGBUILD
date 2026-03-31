# Maintainer: Your Name <your.email@example.com>
pkgname=darktable-nas
pkgver=1.1.0
pkgrel=1
pkgdesc="Launch darktable with NAS-based photo library - optimized for performance"
arch=('any')
url="https://github.com/nefarias-bredd/darktable-nas"
license=('MIT')
depends=('darktable' 'cifs-utils' 'rsync')
optdepends=(
    'tailscale: Remote access via Tailscale VPN'
)
backup=('etc/darktable-nas/darktable-nas.conf.example')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e6fac604f4cf36bd6ae6c8adaa9965043c33b2c3bfb112d0724989e9415f182b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
