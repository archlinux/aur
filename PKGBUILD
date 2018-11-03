# Maintainer: Chris Hobbs (RX14) <chris@rx14.co.uk>

pkgname=nadeshiko
pkgver=2.3.3
pkgrel=1
pkgdesc="A Linux tool to cut short videos with ffmpeg"
arch=('any')
url="https://github.com/deterenkelt/$pkgname"
license=('GPL3')
depends=("wget" "bc" "xdg-utils" "xdg-user-dirs" "ffmpeg" "mediainfo" "perl-file-mimeinfo" "mkvtoolnix-cli")
optdepends=("libnotify: desktop notifications")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/deterenkelt/$pkgname/archive/v$pkgver.tar.gz"
        "add-makefile.diff")
sha256sums=('3474f723f93e9955e3870ddec5ca8e788727f86066040405426e77b9b98c7e5a'
            '11f95514756698d015f54292bf4b65a07b28d123f9ab38d35319a41570eefb29')

prepare() {
    cd $srcdir/Nadeshiko-$pkgver

    patch -p1 < $srcdir/add-makefile.diff
}

package() {
    cd $srcdir/Nadeshiko-$pkgver
    make DESTDIR="$pkgdir" PREFIX=/usr
}
