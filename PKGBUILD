# Maintainer: Your Name <youremail@domain.com>
pkgname=foreign-language-text-reader-bin
pkgver=1.4
pkgrel=1
epoch=
pkgdesc="◆ A handy Java Application for Language Learning ◆"
arch=('any')
url="https://sourceforge.net/projects/foreign-language-text-reader/"
license=('custom')
groups=()
depends=('java-runtime-common')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://sourceforge.net/projects/foreign-language-text-reader/files/foreign_language_text_reader_1_4_0_complete.zip/download"
"foreign-language-text-reader.desktop"
"https://github.com/magnus-ISU/foreign-language-text-reader/raw/master/resources/icon512.png"
)
noextract=()
sha256sums=('b44d164d3503eef0fe6ff3d9889437a83aba3ef24dbad675b831fc5ceed570da'
            'fc7d78c78bad9c73e1514fc2dc498a079e7181f0a7b4830ad5a6c769925a0d79'
            '98def68082dba6be8c22f5dac9d6e14ab63fcb82e3ed48047f0b707cf225abaa')
validpgpkeys=()

package() {
        pushd foreign_language_text_reader_1_4_0_complete

	mkdir -p Demo/
	bsdtar -xf FLTR_Demo_Data.zip -C Demo/
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
	cp -r Demo/* "${pkgdir}/usr/share/doc/${pkgname}/"
        
        install -Dm644 README.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        install -Dm644 FLTR_Documentation.pdf -t "${pkgdir}/usr/share/doc/${pkgname}/"
        install -Dm644 FLTR.jar -t "${pkgdir}/opt/foreign-language-text-reader/"
        popd
        install -Dm755 foreign-language-text-reader.desktop -t "${pkgdir}/usr/share/applications/"
        install -Dm644 icon512.png "${pkgdir}/usr/share/pixmaps/foreign-language-text-reader.png"
}

