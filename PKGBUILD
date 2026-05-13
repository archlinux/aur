# Maintainer: Jack Danger <gzippy@jackdanger.com>
pkgname=gzippy-replace-gzip
pkgver=0.7.0
pkgrel=1
pkgdesc="Replace system gzip/gunzip/zcat with gzippy"
arch=('any')
url="https://github.com/JackDanger/gzippy"
license=('Zlib')
depends=('gzippy-bin')
conflicts=('gzip')
provides=('gzip')

package() {
    # gzip package owns /usr/bin/gzip, /usr/bin/gunzip, /usr/bin/zcat.
    # By declaring conflicts+provides=gzip and owning those paths ourselves,
    # pacman replaces the gzip package cleanly on install.
    install -dm755 "$pkgdir/usr/bin"
    ln -sf gzippy "$pkgdir/usr/bin/gzip"
    ln -sf gzippy "$pkgdir/usr/bin/gunzip"
    ln -sf gzippy "$pkgdir/usr/bin/zcat"
}
