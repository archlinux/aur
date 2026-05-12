# Maintainer: aurinko <archlinux at brloh dot is>
pkgname=paperjam
pkgver=1.2.2
pkgrel=1
pkgdesc="Program for transforming PDF files"
arch=('x86_64')
url="https://mj.ucw.cz/sw/paperjam"
license=('GPL-2.0-or-later')
depends=('glibc' 'qpdf' 'libpaper')
makedepends=('asciidoc')
source=("https://mj.ucw.cz/download/linux/paperjam-1.2.2.tar.gz")
sha256sums=('a281912d00a935f490ce20873e87b82d5203bb6180326be1bec60184acab30fc')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
