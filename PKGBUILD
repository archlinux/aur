# Maintainer: LordDemecrius83 <lorddemecrius83@proton.me>
# Contributor: Tomoghno Sen <tomoghno at outlook dot com>

pkgname=elementary-mixer
pkgver=1.1.0
pkgrel=1
pkgdesc="Change the volume of apps"
arch=('x86_64')
url="https://appcenter.elementary.io/com.github.childishgiant.mixer/"
license=('GPL3')
depends=('granite' 'libhandy')
makedepends=('meson' 'vala')
provides=('com.github.childishgiant.mixer')
conflicts=('com.github.childishgiant.mixer')
source=("mixer-$pkgver.tar.gz::https://github.com/ChildishGiant/mixer/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bb932aedecfd79e74fea5a14953364306f55f8cc3ee789caa90976b7395c9002')

build() {
	arch-meson mixer-$pkgver build
	meson compile -C build
}

# No tests defined
#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
