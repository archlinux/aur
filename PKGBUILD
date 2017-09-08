# Maintainer: M0Rf30
# Contributor: kehon

pkgname=traccar
pkgver=3.14
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
 chmod 755 -R $pkgdir/opt/*
}

md5sums=('679dfe2e7449e23d7265a6ed43e89015'
         '3e230b1b98fb5d0ae71ee08ab96a7c92')
