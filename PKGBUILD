# Maintainer: Germán Osella Massa <gosella@gmail.com>
# Based on a previous PKGBUILD available on AURv3.
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Vinicius de Avila Jorge <vinicius.avila.jorge@gmail.com>
pkgname=cppreference
pkgver=20151129
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library. HTML book."
arch=('any')
url="http://en.cppreference.com/"
license=('CCPL:cc-by-sa')
options=('!strip' '!emptydirs')
depends=('ttf-dejavu')
source=("http://upload.cppreference.com/mwiki/images/6/66/html_book_${pkgver}.tar.gz")
sha256sums=('b92f3f44e498ffe20ded8edc251a297426ba9e60d9651551725ffa8e9f6200f1')

package() {
    rm "$srcdir/reference/common/DejaVuSansMonoCondensed60.ttf"
    rm "$srcdir/reference/common/DejaVuSansMonoCondensed75.ttf"
    mkdir -p "$pkgdir/usr/share/doc/cppreference"
    mv -t "$pkgdir/usr/share/doc/cppreference/" $srcdir/reference/*
}
