# Author: NewEraCracker
# Maintainer: William Grieshaber <me@zee.li>
# Contributor: Xi0N <grayfox.i0n@gmail.com>

pkgname=loic
pkgver=1.1.1.25
pkgrel=4
pkgdesc="An open source network stress tool for Windows. Based on Praetox's project at https://sourceforge.net/projects/loic/ and written in C#."
arch=('any')
url="https://github.com/NewEraCracker/LOIC"
depends=('mono')
makedepends=('monodevelop')
license=('GPL')
source=("https://github.com/NewEraCracker/LOIC/archive/1.1.1.25.tar.gz"
	"loic.desktop" "loic.png")
sha512sums=('d1b8109330f917ab93f20787f697f850db54f1aadffa8c53eeafabf3981136b1185b4cc5c2c5aac6291e8b0fc126be7f7864f3debd77b0cfb0ed9a4d7bb0d91e'
            '26392bbde05dd7828d5485b11f12cd323daa563357e36b0e675e8dbf044ecbf9899867c481a370c8c8cf8a22fb612e80345c69b330ec9ee64274ba4edcaafe35'
            '875c34b9c83517ff7b869cfd1e94c9501c0541849d1249ec2d1589e50d8207ad2e01587f1333433439331d64470cf55c561fdb08337bccac3aa2d72f580a8df6')
build() {
	cd NewEraCracker-LOIC-3a89b36
	mdtool build
}
package() {

	install -dm755 ${pkgdir}/opt/${pkgname}
        install -Dm755 loic.desktop ${pkgdir}/usr/share/applications/loic.desktop
        install -Dm755 ./NewEraCracker-LOIC-3a89b36/bin/Debug/* ${pkgdir}/opt/${pkgname}/
        install -Dm644 loic.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

}
