# Maintainer: Shameempk <mailtoshameempk@gmail.com>
pkgname=polarr
pkgver=4.0.0
pkgrel=1
pkgdesc="Professional Photo Editing Tools for Everyone."
arch=('x86_64')
url="https://www.polarr.co"
license=('custom')
source=("https://s3-us-west-2.amazonaws.com/polarrelectron/ubuntu/${pkgname}_${pkgver}_amd64.deb")
md5sums=("d8074eb8fe5c377adc857ac09d0de2e7")
prepare() {
	tar -xf data.tar.xz
}


package() {
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	
	cp -a ${srcdir}/usr/share/${pkgname}/. "${pkgdir}/usr/share/${pkgname}"
	ln -s "/usr/share/${pkgname}/ppe" "${pkgdir}/usr/bin/polarr"
	
	install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${pkgdir}/usr/share/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
	install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
	
	rm "${pkgdir}/usr/share/${pkgname}/LICENSE"
	rm "${pkgdir}/usr/share/${pkgname}/LICENSES.chromium.html"
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/lintian"
}

