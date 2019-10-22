# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl.git"
license=('GPL3')
provides=("duetwebcontrol=${pkgver}")
conflicts=("duetwebcontrol")
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_${pkgver}-1_all.deb")
sha256sums=('d3fb08062a326807917cbb0b556c3682ea2cb08dccd2d6b6659fe547fbd234ed')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
