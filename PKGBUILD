# Maintainer: barfin
pkgname=ipwebcam
pkgver=20200820
pkgrel=1
pkgdesc="Simple shell script for using IP Webcam as a V4L2 webcam / sound source"
arch=("any")
url="https://github.com/bluezio/ipwebcam-gst"
license=('unknown')
depends=("v4l2loopback-dkms" "adb")
source=("https://raw.githubusercontent.com/bluezio/ipwebcam-gst/master/install-videochat.sh"
		"https://raw.githubusercontent.com/bluezio/ipwebcam-gst/master/run-videochat.sh")
md5sums=('1fe3690f1648688fb2d03a657f1f5e11'
         '01f1efec6fc268d4a757a349005007cc')

package() {
  install -Dm755 "${srcdir}/install-videochat.sh" "${pkgdir}/opt/ipwebcam/install-ipwebcam"
  install -Dm755 "${srcdir}/run-videochat.sh" "${pkgdir}/opt/ipwebcam/run-ipwebcam"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/ipwebcam/install-ipwebcam" "${pkgdir}/usr/bin/install-ipwebcam"
  ln -s "/opt/ipwebcam/run-ipwebcam" "${pkgdir}/usr/bin/run-ipwebcam"
}
