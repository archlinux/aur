# Maintainer: nzbr <aur@nzbr.de>
pkgname=razer-nari-pulseaudio-profile
pkgver=20210210
pkgrel=0
pkgdesc="Pulseaudio profile for Razer Nari"
arch=('any')
url="https://github.com/imustafin/razer-nari-pulseaudio-profile"
license=('MIT')

depends=('pulseaudio>=14.2-2')

source=("$pkgname-$pkgver::git+https://github.com/imustafin/razer-nari-pulseaudio-profile.git#commit=dbcf384fbe788087872601b9b4112594454a0825")
md5sums=('SKIP')

package() {
	cd $pkgname-$pkgver
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 -t "$pkgdir/usr/share/pulseaudio/alsa-mixer/paths/" razer-nari-{input,output-{game,chat}}.conf
	install -Dm644 -t "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/" razer-nari-usb-audio.conf
	install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" 91-pulseaudio-razer-nari.rules
}

