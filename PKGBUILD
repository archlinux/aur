# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
pkgname=dinfo
pkgver=1.0.6
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml and .json output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained.zip")
sha256sums=('80bda057b56f804bfacc17cc14d4ad03d5bb2ca78f201513ef34317d46145c40')

prepare() {
    unzip -q "$srcdir/dinfo-linux-x64-self-contained.zip" -d "$srcdir"
}

package() {
    mkdir -p "$pkgdir/usr/lib/dinfo"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/publish/self-contained/linux-x64/"* "$pkgdir/usr/lib/dinfo/"
    ln -s /usr/lib/dinfo/dinfo-linux-x64-self-contained "$pkgdir/usr/bin/dinfo"
}
