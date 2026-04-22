# Maintainer: Ron <thefangeddeity>
pkgname=hls-livecam-server
pkgver=2.7.2
pkgrel=1
pkgdesc="Stream a USB webcam via HLS using MediaMTX and ffmpeg"
arch=('any')
url="https://github.com/thefangeddeity/hls-livecam-server"
license=('MIT')
depends=('ffmpeg' 'nginx' 'python' 'python-psutil' 'smartmontools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/hls-livecam-server/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37d8376094bf739f16a332ebd38ad39d86f8e5db0a187a013575423bbc16c6b5')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pkg/usr/local/bin/camstack "$pkgdir/usr/local/bin/camstack"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup "$pkgdir/usr/share/hls-livecam-server/hls-livecam-setup"
    install -Dm644 pkg/etc/systemd/system/ffmpeg-cam.service "$pkgdir/etc/systemd/system/ffmpeg-cam.service"
    install -Dm644 pkg/etc/systemd/system/mediamtx.service "$pkgdir/etc/systemd/system/mediamtx.service"
}
