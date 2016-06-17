# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='0d1n'
pkgver='2.1'
pkgrel=1
pkgdesc='A web security tool to make fuzzing at HTTP inputs'
arch=('any')
url='https://github.com/CoolerVoid/0d1n/'
license=('GPL3')
depends=('curl' 'libcurl-compat')
source=('https://github.com/CoolerVoid/0d1n/archive/master.zip')
md5sums=('822e01669bce3b7f6c9391837d1bc51e')
build() {
           cd "${srcdir}"
           cd "${pkgname}-master"
           make
}

package() {
           cd "${srcdir}"
           install -dm755 "${pkgdir}/usr/share/${pkgname}"
           install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
           install -dm755 "${pkgdir}/usr/bin"
           cp -rf 0d1n-master/*	"${pkgdir}/usr/share/${pkgname}/"
           mv "${pkgdir}/usr/share/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/"
           ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}" 
}
