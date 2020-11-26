# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='g90updatefw'
pkgdesc='Xiegu G90 firmware updater'
pkgver=1.2
pkgrel=1
arch=('x86_64') 
url="https://github.com/DaleFarnsworth/${pkgname}"
license=('GPL3')
depends=()
makedepends=('go' 'upx')
source=("${url}/archive/version_${pkgver}.tar.gz")
sha512sums=('e527887f06644534920c7b64a394f64e4acdf2620c3588456cf13c0c21be806f4126f82b7781ce2367e275dbab9009645c3928996fa78bd3d5ef9a4588923dd9')

build()
{
	cd "${srcdir}/${pkgname}-version_${pkgver}"
	make
}

package()
{
	install -Dm755 "${srcdir}/${pkgname}-version_${pkgver}/linux/amd64/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
