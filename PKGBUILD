# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=pingo
pkgver=0.52c
pkgrel=1
pkgdesc="An experimental, visually lossless –or lossy and fast PNG/JPG optimizer (uses wine)"
arch=('i686' 'x86_64')
url="http://css-ig.net/pingo/"
license=('unknown')
depends=('wine')
options=('!strip')
source=("${pkgname}-${pkgver}.zip"::"http://css-ig.net/tools/${pkgname}.zip"
        "https://raw.githubusercontent.com/bermond/shellutils/master/image/${pkgname}")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('109e1d412aac0dde451c3fddc41007de4ecb7e0853972e06ddd3d55ebb170d6c'
            '454d976b5b8fdf146f19228ddec5e532f22eabe68d825ac44a153584db2646e9')

prepare() {
	mkdir -p "${pkgname}-${pkgver}"
	cd       "${pkgname}-${pkgver}"
	bsdtar -x -f ../"${pkgname}-${pkgver}.zip"
}

package() {
	install -D -m755 "$pkgname"                            "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "$pkgname"-"${pkgver}/${pkgname}.exe" "${pkgdir}/usr/share/${pkgname}/${pkgname}.exe"
}
