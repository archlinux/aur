# Maintainer: EndlessEden <endlesseden[at]deep-rose.org>
# NOTE: this was done fast and dirty, please report any issues in the AUR comments, the email address is generally not watched.
pkgname=monado-mercury-hand-data-git
pkgver=1.0.1
pkgrel=1
pkgdesc="ONNX model files for the Monado Mercury hand tracker"
arch=('any')
license=('GPL3')
source=("https://github.com/moshimeow/mercury_steamvr_driver/raw/e3948ace94a9f2cbd949adf50ffcc082002337cc/src/steamvr_driver/mercury/resources/internal/hand-tracking-models/grayscale_detection_160x160.onnx"
        "https://github.com/moshimeow/mercury_steamvr_driver/raw/e3948ace94a9f2cbd949adf50ffcc082002337cc/src/steamvr_driver/mercury/resources/internal/hand-tracking-models/grayscale_keypoint_jan18.onnx"
	"monado-hand-models.conf")
sha256sums=('1f1a039a266e13dc186bb884430ebd9c8216bdda680ab08a533d4c671f27ed36'
            '40c0daa598cedb993b54fff17685231b7465d6db342656c401b01c2029efd1d5'
            'aec2da6f37654f575766eafd4a1ccdec83fd94ca3d3a48503a6b6b16981783d9')

package() {
    # Monado typically looks in /usr/share/monado/
    install -d "$pkgdir/usr/share/monado/mercury"
    install -Dm644 grayscale_detection_160x160.onnx "$pkgdir/usr/share/monado/grayscale_detection_160x160.onnx"
    install -Dm644 grayscale_keypoint_jan18.onnx "$pkgdir/usr/share/monado/grayscale_keypoint_jan18.onnx"
    install -d "$pkgdir/etc/environment.d/"
    install -Dm644 monado-hand-models.conf "$pkgdir/etc/environment.d/monado-hand-models.conf"
}
