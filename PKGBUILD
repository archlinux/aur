# Maintainer: Akhilesh Waghmare <akhi23waghmare@gmail.com>
pkgname=epoch-goals-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist goal tracking dashboard for day, week, month, quarter, and year"
arch=('x86_64')
url="https://github.com/akhilesh-w/epoch"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('epoch-goals')
conflicts=('epoch-goals')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://github.com/akhilesh-w/epoch/releases/download/v${pkgver}/epoch-goals_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    
    # Extract the data archive from the .deb
    bsdtar -xf data.tar.* -C "$pkgdir/"
    
    # Fix permissions
    chmod 755 "$pkgdir/usr/bin/epoch-goals" 2>/dev/null || true
}
