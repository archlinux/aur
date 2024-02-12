# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

pkgname="pdfjumbler"
pkgver=0.4.0
pkgrel=2
pkgdesc="A simple tool to rearrange/merge/delete/rotate pages from PDF files."
arch=('any')
url="https://github.com/mgropp/pdfjumbler"
license=('GPL3')
depends=('java-runtime>=11')
source=("${pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}/${pkgname}.jar"
        "https://raw.githubusercontent.com/mgropp/pdfjumbler/master/LICENSE"
        "${pkgname}.sh")
sha256sums=('551b29996f6e4e4aeedf8b9cf18ef42dcdd467948b7e6a72cd5711a619efd18d'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'fc703e692a41163f92247a45564519e1b27685ff7928bbdd9ebd4264f2698615')

package() {
	install -Dm755 "${pkgname}-${pkgver}.jar" "$pkgdir/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
