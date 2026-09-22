# Maintainer: Jasur Sadikov <jasur@sadikoff.com>
pkgname=mud
pkgver=1.1.10
pkgrel=1
pkgdesc="Multi repository git utility. Manage multiple git-repositories simultaneously."
arch=('x86_64')
url="https://github.com/jasursadikov/mud"
license=('MIT')
provides=("mud-git=$pkgver")
conflicts=('mud-git')
depends=('git' 'glibc' 'zlib' 'ca-certificates')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/mud-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('c2dc9a6387daf80fb788c803048abc91f3edd7fa1dcfc58e00090fde1f46327d')

package() {
    install -d "$pkgdir/opt" "$pkgdir/usr/bin"
    cp -a "$srcdir/mud" "$pkgdir/opt/mud"
    ln -s /opt/mud/mud "$pkgdir/usr/bin/mud"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
