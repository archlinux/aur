# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
pkgname=dinfo
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml and .json output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained.zip")
sha256sums=('2365c50044854dbff5120b01f2c0a0e7cf9e91e5b8ae0e1cbc42e6afc5aab921')

prepare() {
    unzip -q "$srcdir/dinfo-linux-x64-self-contained.zip" -d "$srcdir"
}

package() {
    mkdir -p "$pkgdir/usr/lib/dinfo"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/publish/self-contained/linux-x64/"* "$pkgdir/usr/lib/dinfo/"
    ln -s /usr/lib/dinfo/dinfo-linux-x64-self-contained "$pkgdir/usr/bin/dinfo"
}
