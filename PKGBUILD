# Maintainer: Pixel

pkgname=walrs
pkgver=1.1.7
pkgrel=1
pkgdesc="Generate colorscheme from image"
arch=('x86_64' 'aarch64')
url="https://pi66.xyz/tools/walrs"
license=('GPL3')
depends=('gcc-libs')
source=("https://pi66.xyz/files/walrs-${pkgver}.tar.gz")
sha256sums=('9233610064149952fc34ae7b4bad023ec38472f22cc1344dd2a14121cd611631')

package() {
    cd "$srcdir/walrs"
    bash ./autocomplete.sh

    install -Dm755 walrs "$pkgdir/usr/bin/walrs"
    install -Dm644 walrs.1 "$pkgdir/usr/share/man/man1/walrs.1"

    install -d "$pkgdir/usr/share/walrs/templates"
    install -d "$pkgdir/usr/share/walrs/scripts"
    install -d "$pkgdir/usr/share/walrs/colorschemes"

    cp -a templates/. "$pkgdir/usr/share/walrs/templates/"
    cp -a scripts/. "$pkgdir/usr/share/walrs/scripts/"
    cp -a colorschemes/. "$pkgdir/usr/share/walrs/colorschemes/"

}


