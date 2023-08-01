# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=scheme-chez-symlink
pkgver=1
pkgrel=1
pkgdesc='Replace scheme with chez'
arch=('any')
url='https://github.com/cisco/ChezScheme'
license=('Apache')
depends=('chez-scheme')
provides=('scheme')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1"

    local _file
    for _file in scheme; do
        ln -s chez "$pkgdir/usr/bin/$_file"
        ln -s chez.1.gz "$pkgdir/usr/share/man/man1/$_file".1.gz
    done
}

