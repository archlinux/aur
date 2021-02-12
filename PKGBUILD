# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=3.2.2
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/Duet3D/DuetWebControl.git"
license=('GPL3')
provides=("duetwebcontrol=${pkgver}")
conflicts=("duetwebcontrol")
depends=('duetsoftwareframework>=3.2.0')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_${pkgver}_all.deb")
md5sums=('1cda0b3fdfe179f584668494b2855a82')
sha1sums=('494fd38899082bc9ffa0d2e2b8ae1f7ad5044b66')
sha256sums=('f1d0967c31fda8b7bdd1f6efa2149d6e2306e23f02c4b58b5ec60a26b633417c')
sha512sums=('98acae260ce06c44df853f8c0d723a4699fef48bac575bf54bbf7b205b13d74314cb5902efffb0b221664c3ddc0eb1133ae59977276c032eb836898b7e6a6e65')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc"
	cp -R "${srcdir}/opt/dsf/dwc/"* "${pkgdir}/opt/dsf/dwc"
	chown -R dsf:dsf "${pkgdir}/opt/dsf/dwc"
}
