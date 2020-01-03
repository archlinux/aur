# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=2.0.4
pkgrel=2
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl.git"
license=('GPL3')
provides=("duetwebcontrol=${pkgver}")
conflicts=("duetwebcontrol")
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_${pkgver}-1_all.deb")
sha512sums=('67d3072d88a9e31d6d4688c1ec6c3c2502295189244d2636af5cddc9e1df31457f8b343994bad69d392ca1d927047afb46c8c39e067c250c8afcc24017d1e980')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
