# Maintainer: Your Name <your.email@example.com>
pkgname=darktable-nas
pkgver=1.0.0
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
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
