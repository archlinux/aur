pkgname=mybase-desktop-bin
pkgver=831
pkgrel=1
pkgdesc='A high-quality free-form database program for personal note-taking and knowledgebase management'
arch=('x86_64')
url='http://www.wjjsoft.com'
license=('custom: commercial')
depends=(libxml2-legacy)
provides=('mybase-desktop')
conflicts=('mybase-desktop')
source=(
	"http://www.wjjsoft.com/downloads/Mybase-Desktop-Ver${pkgver}-Linux-amd64.tar.xz"
	"Mybase8.desktop"
)
sha512sums=('729754fe94bbb1a52f31017c85590be1b58488cbbc11f1fb6b8e18447c59639a18cf3cb37470bb5eef7e7299efc85999a8b70225198cc51a56542e62c76d91c0'
	'0d74a4161edd7efd49bf5950d9ad9bae183e20044dbb53e49e403275d0308d9850a48fb9546f482e5e9cb32b57e1d37e50ec3d21cdb91e97cc8b1b406c30b0c7')

package() {
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/icons"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/opt"

	cp -r "${srcdir}/Mybase8" "${pkgdir}/opt/"
	install -m644 "${srcdir}/Mybase8/nyf8_logo_256.png" "${pkgdir}/usr/share/icons/Mybase8.png"
	install -m644 "${srcdir}/Mybase8.desktop" "${pkgdir}/usr/share/applications/Mybase8.desktop"
	#ln -s /opt/MyBase8/Mybase.run "${pkgdir}/usr/bin/Mybase8"
}
