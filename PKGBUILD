# Maintainer: nzbr <aur@nzbr.de>
pkgname=razer-nari-pulseaudio-profile
pkgver=0
pkgrel=2
pkgdesc="Pulseaudio profile for Razer Nari"
arch=('any')
url="https://github.com/Omico/razer-nari-pulseaudio-profile"
license=('MIT')

depends=('pulseaudio')

source=("$pkgname-$pkgver::git+https://github.com/Omico/razer-nari-pulseaudio-profile.git#commit=651673bad46af1595bfac0ff8a05c89e806d86f4")
md5sums=('SKIP')

package() {
	cd $pkgname-$pkgver
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 -t "$pkgdir/usr/share/pulseaudio/alsa-mixer/paths/" razer-nari-output-{game,chat}.conf
	install -Dm644 -t "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/" razer-nari-usb-audio.conf
	install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" 91-pulseaudio-razer-nari.rules
}

