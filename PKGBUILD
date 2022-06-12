
# Maintainer: Demir Yerli <demiryerli@gmail.com>
pkgname=razer-nari-pipewire-profile
pkgver=1.1
_pkgver=v$pkgver
pkgrel=2
epoch=2
pkgdesc="Razer Nari headsets pipewire profile"
arch=("any")
url="https://github.com/mrquantumoff/razer-nari-pipewire-profile"
license=('MIT')
groups=("mrquantumoff")
depends=('pipewire-pulse' 'bash')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('razer-nari-pulseaudio-profile')
source=("https://github.com/mrquantumoff/razer-nari-pipewire-profile/archive/refs/tags/"$_pkgver".tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd razer-nari-pipewire-profile-$pkgver
	mv * $srcdir
}

package() {
	cd $srcdir
    install -Dm644 -t "$pkgdir/usr/share/alsa-card-profile/mixer/paths/" razer-nari-{input,output-{game,chat}}.conf
    install -Dm644 -t "$pkgdir/usr/share/alsa-card-profile/mixer/profile-sets/" razer-nari-usb-audio.conf
    install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" 91-pulseaudio-razer-nari.rules
}
