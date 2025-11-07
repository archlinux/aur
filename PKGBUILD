# Maintainer: Jonah Barkley-Griggs <jbarkleygriggs@gmail.com>

pkgname=walrs-extended
pkgver=1.0.0
pkgrel=1
pkgdesc="Generate colorscheme from image"
arch=('x86_64' 'aarch64')
url="https://github.com/Jsbarkleygriggs/walrs-extended"
license=('GPL3')
makedepends=('gcc-libs')
source=("git+$url.git")
sha256sums=('SKIP')
conflicts=('walrs')

package() {
    cd "$srcdir/walrs-extended"
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

