# Maintainer: TheTrueColonel <benjaminesims@gmail.com>
# Previous Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: laptander <dev-laptander a|t yandex d|o|t ru>
pkgname=ipwebcam-gst-git
pkgver=r141.5a02ffa
pkgrel=1
pkgdesc="Allows usage of an Android phone to be used as a webcam and/or microphone"
arch=('any')
url="https://github.com/bluezio/ipwebcam-gst"
license=('GPL-3.0-only')
depends=('android-tools' 'bash' 'gst-plugins-good' 'gstreamer' 'pulse-native-provider' 'v4l-utils' 'v4l2loopback-dkms' 'zenity')
makedepends=('git')
optdepends=('pavucontrol: change playback/record devices')
provides=("${pkgname%-gst-git}")
conflicts=("${pkgname%-gst-git}")
source=("$pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 run-videochat.sh "$pkgdir/usr/bin/run-videochat"
}
