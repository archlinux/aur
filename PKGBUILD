# Maintainer: Sckab <giulianodeamicis2009@gmail.com>
pkgname=dinfo
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml and .json output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained.zip")
sha256sums=('3e89626a0e7c5edd213170d0f0e3d44998fd70f9fb36c9c788828fae5d91393b')

prepare() {
    unzip -q "$srcdir/dinfo-linux-x64-self-contained.zip" -d "$srcdir"
}

package() {
    mkdir -p "$pkgdir/usr/lib/dinfo"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/publish/self-contained/linux-x64/"* "$pkgdir/usr/lib/dinfo/"
    ln -s /usr/lib/dinfo/dinfo-linux-x64-self-contained "$pkgdir/usr/bin/dinfo"
}
