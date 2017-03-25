# Maintainer: Barna Csorogi <barnacs@justletit.be>
pkgname=galliumos-braswell-config
pkgver=1.0.0
pkgrel=1
pkgdesc="userspace configuration for braswell chromebooks taken from GalliumOS"
arch=('any')
url="https://github.com/GalliumOS/galliumos-braswell"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/GalliumOS/galliumos-braswell")
md5sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/share/alsa/ucm/chtrt5650"
	install -m644 "${srcdir}/galliumos-braswell/usr/share/alsa/ucm/chtrt5650/HiFi.conf" "${pkgdir}/usr/share/alsa/ucm/chtrt5650/"
  install -m644 "${srcdir}/galliumos-braswell/usr/share/alsa/ucm/chtrt5650/chtrt5650.conf" "${pkgdir}/usr/share/alsa/ucm/chtrt5650/"

  mkdir -p "${pkgdir}/etc/modprobe.d"
	install -m644 "${srcdir}/galliumos-braswell/etc/modprobe.d/alsa-chtrt5650.conf" "${pkgdir}/etc/modprobe.d/"

  mkdir -p "${pkgdir}/etc/pulse"
  install -m644 "${srcdir}/galliumos-braswell/etc/pulse/default.pa" "${pkgdir}/etc/pulse/"

  mkdir -p "${pkgdir}/usr/share/pulseaudio/alsa-mixer/paths"
  install -m644 "${srcdir}/galliumos-braswell/usr/share/pulseaudio/alsa-mixer/paths/analog-output-headphones.conf" "${pkgdir}/usr/share/pulseaudio/alsa-mixer/paths/"
  install -m644 "${srcdir}/galliumos-braswell/usr/share/pulseaudio/alsa-mixer/paths/analog-output-speaker.conf" "${pkgdir}/usr/share/pulseaudio/alsa-mixer/paths/"
}
