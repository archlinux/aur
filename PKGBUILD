# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/Duet3D/DuetWebControl.git"
license=('GPL3')
provides=("duetwebcontrol=${pkgver}")
conflicts=("duetwebcontrol")
depends=('duetsoftwareframework>=3.2.0')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_${pkgver}_all.deb")
md5sums=('1dfdc94c6861889f384b546a8a461c36')
sha1sums=('57b51c02607fcc009645b0175161580ebb2a3a38')
sha256sums=('5b4900a6c15e1451c37cb99af5f5d9961020395a72dac6d51f4f35b5b848f083')
sha512sums=('493dea98a1c861fb20284473df2f0dba155705173a9e3e904b068d54f788971005dfee9bf8bf3fc9981b9e2560a69092fc95938d0fde280f443d5f7444ec66f3')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc"
	cp -R "${srcdir}/opt/dsf/dwc/"* "${pkgdir}/opt/dsf/dwc"
	chown -R dsf:dsf "${pkgdir}/opt/dsf/dwc"
}
