# Maintainer: Germán Osella Massa <gosella@gmail.com>
# Based on a previous PKGBUILD available on AURv3.
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Vinicius de Avila Jorge <vinicius.avila.jorge@gmail.com>
pkgname=cppreference
pkgver=20241110
pkgrel=1
pkgdesc="A complete reference for the features in the C++ Standard Library. HTML book."
arch=('any')
url="http://en.cppreference.com/"
license=('CCPL:cc-by-sa')
options=('!strip' '!emptydirs')
depends=('ttf-dejavu')
source=("https://github.com/PeterFeicht/cppreference-doc/releases/download/v${pkgver}/html-book-${pkgver}.tar.xz")
sha256sums=('431e80862eb70fd4793a60d7d3b6c13c8605284978f9ea0529572e8fd1562cc6')

package() {
    rm "$srcdir/reference/common/DejaVuSansMonoCondensed60.ttf"
    rm "$srcdir/reference/common/DejaVuSansMonoCondensed75.ttf"
    mkdir -p "$pkgdir/usr/share/doc/cppreference"
    mv -t "$pkgdir/usr/share/doc/cppreference/" $srcdir/reference/*
}
