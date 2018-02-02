# Maintainer: copygirl <copygirl@mcft.net>
pkgname=pulseaudio-arctis7
pkgver=1.0
pkgrel=1
pkgdesc="Configuration files to support SteelSeries Arctis 7 mono/stereo output on pulseaudio"
arch=("any")
license=("LGPL")
depends=("pulseaudio")
options=()
source=("90-pulseaudio-arctis7.rules"
        "steelseries-arctis-input.conf"
        "steelseries-arctis-output-mono.conf"
        "steelseries-arctis-output-stereo.conf"
        "steelseries-arctis-usb-audio.conf")
md5sums=("6a489d6877963b7260b5e63e4348a360"
         "2a68f9d0ee3a89c47d0c7781c8f46ce0"
         "0134ec266ddef9a1d4bcfc206b6bcc1d"
         "e8ca5d47324c9b0504e131e9919e109d"
         "b16786cf6b6fd16fe54fbd5770db7447")

package() {
	install -dm 755 ${pkgdir}/usr/{udev/rules.d,share/pulseaudio/alsa-mixer/{paths,profile-sets}}
	install -Dm 644 90-pulseaudio-arctis7.rules ${pkgdir}/usr/udev/rules.d/
	install -Dm 644 steelseries-arctis-input.conf ${pkgdir}/usr/share/pulseaudio/alsa-mixer/paths
	install -Dm 644 steelseries-arctis-output-mono.conf ${pkgdir}/usr/share/pulseaudio/alsa-mixer/paths
	install -Dm 644 steelseries-arctis-output-stereo.conf ${pkgdir}/usr/share/pulseaudio/alsa-mixer/paths
	install -Dm 644 steelseries-arctis-usb-audio.conf ${pkgdir}/usr/share/pulseaudio/alsa-mixer/profile-sets
}
