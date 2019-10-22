# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl.git"
license=('GPL3')
provides=("duetwebcontrol=${pkgver}")
conflicts=("duetwebcontrol")
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_${pkgver}-1_all.deb")
sha256sums=('5eaa9886bdd1b8c6943e287f662af05854c2532288b44346e4e86572e29f5e90')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
