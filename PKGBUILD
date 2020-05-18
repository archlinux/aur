# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetsd-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Virtual SD card directory for the Duet software framework"
arch=('any')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetsd=${pkgver}")
conflicts=("duetsd" "reprapfirmware<=1.1.0.0")
depends=('duetcontrolserver')
optdepends=('duetwebcontrol')
backup=('opt/dsf/sd/sys/config.g')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetsd_${pkgver}_all.deb")
md5sums=('3a92b26f621cc3da0aa7163c3139eff3')
sha1sums=('fba26089ec26f2a9af3a7c5348b48309a49f3547')
sha256sums=('f9a3c668f1ad02af49e9a2b81a2904b6f82209793b1527cffdff87ee48bc3fe9')
sha512sums=('30c6673b6bdefbbe30ee97b8cffd2e2c1d661ee97c7fe957e9dbd745cf11b22129f54676f3643d858d91e220b8231837ac99c57784ed0c471e7497f71f29fbea')

prepare() {
    tar -xf data.tar.xz
}

package() {
	# Virtual SD Card
	install -dm 755 "${pkgdir}/opt/dsf/sd/"{sys,macros,gcodes,filaments,firmware}
	install -m 644 "${srcdir}/opt/dsf/sd/sys/"* "${pkgdir}/opt/dsf/sd/sys/"
	ln -s "/opt/dsf/dwc2" "${pkgdir}/opt/dsf/sd/www"
}
