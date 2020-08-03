# Author: NewEraCracker
# Maintainer: Mykyta Poturai <mykyta.poturai@tutanota.com>
# Contributor: Xi0N <grayfox.i0n@gmail.com>

pkgname=loic
pkgver=2.0.0.4
_pkgver=2.0.0.4-1
pkgrel=5
pkgdesc="An open source network stress tool for Windows. Based on Praetox's project at https://sourceforge.net/projects/loic/ and written in C#."
arch=('any')
url="https://github.com/NewEraCracker/LOIC"
depends=('mono')
license=('GPL')
source=("https://github.com/NewEraCracker/LOIC/archive/${_pkgver}.tar.gz"
	"loic.desktop" "loic.png" "loic")
sha512sums=('b7352e4be57e0928562535470bcef33280028bcc190ed5ea19735a015285a021c9d0c71be6048d9cbcc43b24bb0005ccd1f1f5b90090b7baccb4b0b903b6b850'
            '26392bbde05dd7828d5485b11f12cd323daa563357e36b0e675e8dbf044ecbf9899867c481a370c8c8cf8a22fb612e80345c69b330ec9ee64274ba4edcaafe35'
            '875c34b9c83517ff7b869cfd1e94c9501c0541849d1249ec2d1589e50d8207ad2e01587f1333433439331d64470cf55c561fdb08337bccac3aa2d72f580a8df6'
            'b48abc85843561a2be503637ceb83cfc970bd88f9497f76d7b38c128d497749945e5f81f7a9623fd621736752c75761dc00fbd0abeda925c1af0e0286d34b0e9')
build() {
	cd "$srcdir/LOIC-$_pkgver/src"
	xbuild
}

package() {
	install -dm755 ${pkgdir}/opt/${pkgname}
        install -Dm755 loic.desktop ${pkgdir}/usr/share/applications/loic.desktop
        install -Dm755 loic ${pkgdir}/usr/bin/loic
        install -Dm755 $srcdir/LOIC-$_pkgver/src/bin/Debug/* ${pkgdir}/opt/${pkgname}/
        install -Dm644 loic.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

}
