pkgname=epub2pdf
pkgver=0.5
pkgrel=1
pkgdesc="epub2pdf is a command-line tool that quickly generates PDF files from EPUB ebooks. It will run on any platform that supports JRE version 6 or later."
arch=('any')
url="http://epub2pdf.com"
license=('GPL3')
depends=('java-runtime>=6')
source=("http://download.openpkg.org/components/cache/epub2pdf/epub2pdf-0.5.zip"
"epub2pdf.sh")
md5sums=('7189ee61628a72dfdb89120aa9e86a89'
'SKIP')

package() {
    mkdir -p ${pkgdir}/usr/share/java/epub2pdf/
    cd ${srcdir}/${pkgname}/
    rm -f ./epub2pdf.bat
    rm -f ./epub2pdf.sh
    cp -R * ${pkgdir}/usr/share/java/epub2pdf/
    find ${pkgdir}/usr/share/java/epub2pdf/* -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr/share/java/epub2pdf/* -type d -exec chmod 755 {} \;
    mkdir -p ${pkgdir}/usr/bin/
    install -Dm755 ${srcdir}/epub2pdf.sh \
    ${pkgdir}/usr/bin/epub2pdf || return 1
}
