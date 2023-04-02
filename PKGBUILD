# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='g90updatefw'
pkgdesc='Xiegu G90 and Xiego G106 Firmware Updater'
pkgver=1.5
pkgrel=1
arch=('x86_64') 
url="https://github.com/DaleFarnsworth/${pkgname}"
license=('GPL3')
depends=()
makedepends=('go' 'upx')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1fb1a4c343bbe7b4cbe8e81e95f697e0ce3423d729d6a39a4d1b629288d90b56')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package()
{
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/linux/amd64/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
