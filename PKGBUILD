# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Avi Zimmerman <avi.zimmerman@gmail.com>
pkgname=nzyme-bin
pkgver=1.2.2
pkgrel=2
pkgdesc="A free and open next-generation WiFi defense system."
arch=("x86_64")
license=("SSPL")
url="https://www.nzyme.org/"
_githuburl="https://github.com/lennartkoopmann/nzyme"
depends=('java-runtime' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::https://assets.nzyme.org/releases/nzyme-1.2.2.deb"
	"LICENSE::https://raw.githubusercontent.com/lennartkoopmann/nzyme/master/COPYING")
sha256sums=('fb59a0b60736a5ddb03a8c69c2a1b925b25726b32bf32b6e38b710741e5b122b'
            '34e94c5087ba6e9fb34f35ae71df5e6533c5fc7cbbf6c44186a71e82806b69e1')
package() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
	install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}