# Maintainer: Feresey <p.milko1999@yandex.ru>
pkgname=exo-player
arch=(x86_64)
pkgdesc="eXo music player based on moc"
pkgver=8.0
pkgrel=3
source=(git://github.com/Feresey/exo)
url=https://blaze.alwaysdata.net/exo
sha1sums=('SKIP')
license=(GPL)

makedepends=(gcc cmake)
depends=(liblastfm-qt5
        qt5-base
        moc
        python3
        python-notify2)

build() {
    cd $srcdir/exo
    [[ ! -d build ]] && mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
    make
}

package() {
    cd $srcdir/exo/build
    make install
}

