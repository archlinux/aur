# Maintainer: Ron <thefangeddeity>
pkgname=hls-livecam-server
pkgver=2.5.2
pkgrel=1
pkgdesc="Stream a USB webcam via HLS using MediaMTX and ffmpeg"
arch=('any')
url="https://github.com/thefangeddeity/hls-livecam-server"
license=('MIT')
depends=('ffmpeg' 'nginx' 'python' 'python-psutil' 'smartmontools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/hls-livecam-server/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("7b28e6e1b41c87008fe86c451c3b5247b881e88e12a84378511ec2caa430c3b7")

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pkg/usr/local/bin/camstack "$pkgdir/usr/local/bin/camstack"
    install -Dm755 pkg/usr/share/hls-livecam-server/hls-livecam-setup "$pkgdir/usr/share/hls-livecam-server/hls-livecam-setup"
    install -Dm644 pkg/etc/systemd/system/ffmpeg-cam.service "$pkgdir/etc/systemd/system/ffmpeg-cam.service"
    install -Dm644 pkg/etc/systemd/system/mediamtx.service "$pkgdir/etc/systemd/system/mediamtx.service"
}
