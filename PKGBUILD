# Maintainer: ambition-echo <ambition_echo@outlook.com>

pkgname=linsmith-bin
pkgver=0.99.30
pkgrel=1
pkgdesc="A Smith Charting program, mainly designed for educational use"
arch=('x86_64')
url="http://jcoppens.com/soft/linsmith/index.en.php"
license=('GPL')
source=("http://http.us.debian.org/debian/pool/main/l/linsmith/linsmith_0.99.30-1+b1_amd64.deb")
sha256sums=('fbb54ba64edc0ddd29eea827b275d8fc8960c28bf7063770939e2c519ac95718')
depends=('libgnomeui' 'tcl')
build() {
    bsdtar -xpf "$srcdir/linsmith_0.99.30-1+b1_amd64.deb"
    bsdtar -xpf "$srcdir/data.tar.xz"
}
package() {
    cd $srcdir
    
    install -D ./usr/bin/linsmith $pkgdir/usr/bin/linsmith
    install -Dm644 ./usr/share/applications/linsmith.desktop $pkgdir/usr/share/applications/linsmith.desktop
    install -Dm644 ./usr/share/pixmaps/linsmith/linsmith_icon.xpm $pkgdir/usr/share/pixmaps/linsmith/linsmith_icon.xpm
    install -Dm644 ./usr/share/man/man1/linsmith.1.gz $pkgdir/usr/share/man/man1/linsmith.1.gz

    install -Dm644 ./usr/share/locale/zh/LC_MESSAGES/linsmith.mo $pkgdir/usr/share/locale/zh/LC_MESSAGES/linsmith.mo
    install -Dm644 ./usr/share/locale/de/LC_MESSAGES/linsmith.mo $pkgdir/usr/share/locale/de/LC_MESSAGES/linsmith.mo
    install -Dm644 ./usr/share/locale/es/LC_MESSAGES/linsmith.mo $pkgdir/usr/share/locale/es/LC_MESSAGES/linsmith.mo
    install -Dm644 ./usr/share/locale/hu/LC_MESSAGES/linsmith.mo $pkgdir/usr/share/locale/hu/LC_MESSAGES/linsmith.mo
    install -Dm644 ./usr/share/locale/it/LC_MESSAGES/linsmith.mo $pkgdir/usr/share/locale/it/LC_MESSAGES/linsmith.mo
    install -Dm644 ./usr/share/locale/sv/LC_MESSAGES/linsmith.mo $pkgdir/usr/share/locale/sv/LC_MESSAGES/linsmith.mo

    install -D ./usr/share/doc/linsmith/examples/* -t $pkgdir/usr/share/doc/linsmith/examples
    install -D ./usr/share/doc/linsmith/manual.pdf.gz $pkgdir/usr/share/doc/linsmith/manual.pdf.gz
}   
