# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('restream')
_pkgname='reStream'
pkgdesc="Shell script for sharing the reMarkable's screen over SSH."
pkgver=1.2.0
pkgrel=1
url="https://github.com/rien/restream"
arch=('any')
license=('MIT')
depends=('openssh' 'ffmpeg')
makedepends=('git')
optdepends=('lz4: sub-second latency streaming (see README)' 'v4l2loopback-dkms: stream reMarkable as a webcam')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4166142b15e1e7363dac302aa92aad5b44e0514cab233abecb51414952c1d5a1')
conflicts=('restream-git')

package() {
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/README.md" "$pkgdir/usr/share/$pkgname/README.md"
    install -Dm755 $srcdir/$_pkgname-$pkgver/reStream.sh $pkgdir/usr/bin/restream
}

