# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Andrew Rabert <draje@nullsum.net>
# Contributor: Filippo Veneri <filippo[dot]veneri[at]gmail[dot]com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=acpilight
pkgver=1.2
pkgrel=3
pkgdesc="A backward-compatible xbacklight replacement based on ACPI"
arch=('any')
url="https://gitlab.com/wavexx/${pkgname}"
license=('GPL-3.0-only')
depends=('python')
provides=('xorg-xbacklight')
conflicts=('xorg-xbacklight')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
install="${pkgname}.install"
sha512sums=('e129de51911df83224ab99c0e7c9cda8058ee748e11473595add0e22367b21716fe62e14461300ca812c4be3485138b7f0f4823d848e3a0386680522621ec121')

package() {
  cd "${pkgname}-v${pkgver}"
  install -vDm0755 xbacklight "${pkgdir}/usr/bin/xbacklight"
  install -vDm0644 xbacklight.1 "${pkgdir}/usr/share/man/man1/xbacklight.1"
  install -vDm0644 90-backlight.rules "${pkgdir}/usr/lib/udev/rules.d/90-backlight.rules"
  install -vDm0644 README.rst NEWS.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
