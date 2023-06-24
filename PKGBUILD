# Maintainer: asukaminato <i at asukaminato at eu at org>
pkgname=foreign-language-text-reader-bin
pkgver=1.4
pkgrel=1
pkgdesc="◆ A handy Java Application for Language Learning ◆"
arch=('any')
url="https://sourceforge.net/projects/foreign-language-text-reader/"
license=('custom')
depends=('java-runtime-common')
source=("https://sourceforge.net/projects/foreign-language-text-reader/files/foreign_language_text_reader_1_4_0_complete.zip/download"
	"foreign-language-text-reader.desktop"
	"https://github.com/magnus-ISU/foreign-language-text-reader/raw/master/resources/icon512.png"
)
sha256sums=('b44d164d3503eef0fe6ff3d9889437a83aba3ef24dbad675b831fc5ceed570da'
	'fc7d78c78bad9c73e1514fc2dc498a079e7181f0a7b4830ad5a6c769925a0d79'
	'98def68082dba6be8c22f5dac9d6e14ab63fcb82e3ed48047f0b707cf225abaa')

package() {
	pushd foreign_language_text_reader_1_4_0_complete
	install -d Demo/
	bsdtar -xvpf FLTR_Demo_Data.zip -C Demo/
	install -d "${pkgdir}/usr/share/doc/${pkgname}/"
	cp -r Demo/* "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 FLTR_Documentation.pdf -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 FLTR.jar -t "${pkgdir}/opt/foreign-language-text-reader/"
	popd
	install -Dm644 foreign-language-text-reader.desktop -t "${pkgdir}/usr/share/applications/"
	install -Dm644 icon512.png "${pkgdir}/usr/share/pixmaps/foreign-language-text-reader.png"
}
