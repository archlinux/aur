# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=pingo
pkgver=0.57b
pkgrel=1
pkgdesc="An experimental, visually lossless –or lossy and fast PNG/JPG optimizer (uses wine)"
arch=('i686' 'x86_64')
url="http://css-ig.net/pingo/"
license=('unknown')
depends=('wine')
options=('!strip')
source=("${pkgname}-${pkgver}.zip"::"http://css-ig.net/downloads/${pkgname}.zip"
        "https://raw.githubusercontent.com/bermond/shellutils/master/image/${pkgname}")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('38237142101c121d418fb3d6a20479013f95bcac6f076a7f4d5ebf9ab6d86129'
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
