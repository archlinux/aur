# Maintainer: M0Rf30
# Contributor: kehon

pkgname=traccar
pkgver=3.11
pkgrel=1
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
depends=(java-runtime)
source=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/$pkgname-linux-$pkgver.zip"
	"$pkgname.service")

package() {
 cd ${srcdir}
 ./traccar.run --noexec --target $pkgdir/opt/traccar/
 install -m755 -d "${pkgdir}/usr/lib/systemd/system"
 install -m644 "${srcdir}/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
 install -m755 -d "${pkgdir}/opt/traccar/init.d"
}

md5sums=('024bee353d3fb38008e73496c00dabe8'
	 '3e230b1b98fb5d0ae71ee08ab96a7c92')
