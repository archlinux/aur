# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('restream')
_pkgname='reStream'
pkgdesc="Shell script for sharing the reMarkable's screen over SSH."
pkgver=1.3.1
pkgrel=1
url="https://github.com/rien/restream"
arch=('any')
license=('MIT')
depends=('openssh' 'ffmpeg')
makedepends=('git')
optdepends=('lz4: sub-second latency streaming (see README)' 'v4l2loopback-dkms: stream reMarkable as a webcam')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('caa65066f6b5c28aa74834dc4762920e472368ed93cdc4057af90804a1371f6b')
conflicts=('restream-git')

package() {
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/README.md" "$pkgdir/usr/share/$pkgname/README.md"
    install -Dm755 $srcdir/$_pkgname-$pkgver/reStream.sh $pkgdir/usr/bin/restream
}

