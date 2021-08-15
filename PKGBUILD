# Maintainer: Aditya Sirish <aditya@saky.in>
pkgname=('restream')
pkgdesc="Shell script for sharing the reMarkable's screen over SSH."
pkgver=1.1
pkgrel=1
url="https://github.com/rien/restream"
arch=('any')
license=('MIT')
depends=('openssh' 'ffmpeg')
makedepends=('git')
optdepends=('lz4: sub-second latency streaming (see README)' 'v4l2loopback-dkms: stream reMarkable as a webcam')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')
conflicts=('restream-git')
provides=('restream')

package() {
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/$pkgname/README.md"
    install -Dm755 $srcdir/$pkgname/reStream.sh $pkgdir/usr/bin/restream
}

