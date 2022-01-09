
# Maintainer: Demir Yerli <demiryerli@gmail.com>
pkgname=razer-nari-pipewire-profile
pkgver=1.0
pkgrel=1
pkgdesc="Razer Nari headsets pipewire profile"
arch=("any")
url="https://github.com/mrquantumoff/razer-nari-pipewire-profile"
license=('UNKNOWN')
groups=()
depends=('pipewire-pulse' 'bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('razer-nari-pulseaudio-profile')
source=("https://github.com/mrquantumoff/razer-nari-pipewire-profile/archive/refs/tags/"$pkgver".tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd razer-nari-pipewire-profile-$pkgver
	mv * $srcdir
}

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/share/alsa-card-profile/mixer/paths/
	mkdir -p $pkgdir/usr/share/alsa-card-profile/mixer/profile-sets/
	mkdir -p $pkgdir/lib/udev/rules.d/
	cp razer-nari-input.conf $pkgdir/usr/share/alsa-card-profile/mixer/paths/
	cp razer-nari-output-{game,chat}.conf $pkgdir/usr/share/alsa-card-profile/mixer/paths/
	cp razer-nari-usb-audio.conf $pkgdir/usr/share/alsa-card-profile/mixer/profile-sets/
	cp 91-pulseaudio-razer-nari.rules $pkgdir/lib/udev/rules.d/
}
