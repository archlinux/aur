# Maintainer: Piotr Patalong <piotr@patalong.pl>
pkgname=lrzsz-shim
pkgver=0.1.0
pkgrel=1
pkgdesc="A shim for lrzsz providing the rz and sz XMODEM binaries"
arch=('x86_64')
url="https://www.ohse.de/uwe/software/lrzsz.html"
license=('GPL2')
depends=('lrzsz')


package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1"

    local _file
    for _file in rz sz; do
        ln -s lrzsz-$_file "$pkgdir/usr/bin/$_file"
        ln -s lrzsz-$_file.1.gz "$pkgdir/usr/share/man/man1/$_file".1.gz
    done
}
