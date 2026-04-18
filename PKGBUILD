# Maintainer: Ron <thefangeddeity>
pkgname=hls-livecam-server
pkgver=2.5.3
pkgrel=1
pkgdesc="Stream a USB webcam via HLS using MediaMTX and ffmpeg"
arch=('any')
url="https://github.com/thefangeddeity/hls-livecam-server"
license=('MIT')
depends=('ffmpeg' 'nginx' 'python' 'python-psutil' 'smartmontools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/hls-livecam-server/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("5fcd48c7b2b6ca116e219dbb5a7f0431a05f722ddae546129f4f9ba3fe4da6b4")

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pkg/usr/local/bin/camstack "$pkgdir/usr/local/bin/camstack"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup "$pkgdir/usr/share/hls-livecam-server/hls-livecam-setup"
    install -Dm644 pkg/etc/systemd/system/ffmpeg-cam.service "$pkgdir/etc/systemd/system/ffmpeg-cam.service"
    install -Dm644 pkg/etc/systemd/system/mediamtx.service "$pkgdir/etc/systemd/system/mediamtx.service"
}
