# Maintainer: Super Tecno Gym <banana@grrlz.net>

pkgname="pd-mapper"
pkgdesc="Qualcomm IPC Router protocol"
pkgver=1.1
pkgrel=1
arch=(aarch64 x86_64)
url="https://github.com/linux-msm/pd-mapper"
license=("BSD-3-Clause")
conflicts=("${pkgname%-git}")
groups=(qcom-icnss-wlan)
makedepends=()
_srcname="${pkgname}-${pkgver}"
source=(
	"${_srcname}.tar.gz::https://github.com/linux-msm/pd-mapper/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('7654a7fb8b70b0c7670f98ad9313649abc48eabcef84dad086ed01408fd538a2')

build() {
	cd "$_srcname"

	make prefix=/usr
}

package() {
	cd "$_srcname"

	make prefix=/usr DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
