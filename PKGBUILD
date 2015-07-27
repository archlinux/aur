# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

pkgname=("android-auto-api-simulators")
pkgver=r01
pkgrel=2
pkgdesc="Android Audo API Simulators Package"
arch=("i686" "x86_64")
url="http://developer.android.com/auto"
license=("custom")
depends=("android-sdk")
options=("!strip")
source=(
	"https://dl-ssl.google.com/android/repository/simulator_${pkgver}.zip"
	"source.properties"
)
sha1sums=(
	"4fb5344e34e8faab4db18af07dace44c50db26a7"
	"1f559e64adec827844d99aed4194e19dc09e9189"
)

package() {
	install -dm755 "${pkgdir}/opt/android-sdk/extras/google/"
	cp -ar "${srcdir}/simulator" "${pkgdir}/opt/android-sdk/extras/google/simulators"
	install -Dm644 "${srcdir}/source.properties" "${pkgdir}/opt/android-sdk/extras/google/simulators/"

	chmod -R ugo+rX "${pkgdir}/opt"
}
