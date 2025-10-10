# Maintainer: Sckab <giuliano@scsdc-co.org>
# Contributor: FrancyAngy <francesco@scsdc-co.org>
pkgname=dinfo
pkgver=1.2.2
pkgrel=1
pkgdesc="A simple program that gives you informations about a file/directory, support .yaml, .json and html output"
arch=('x86_64')
url="https://github.com/SCSDC-co/DINFO"
license=('GPL 3.0')

source=("https://github.com/SCSDC-co/DINFO/releases/download/v$pkgver/dinfo-linux-x64-self-contained.zip")
sha256sums=('3307691878d465ab8e89cec4c40f5e9660b07a4c1b5ab2b41c3e140c129163d2')

prepare() {
    unzip -q "$srcdir/dinfo-linux-x64-self-contained.zip" -d "$srcdir"
}

package() {
    mkdir -p "$pkgdir/usr/lib/dinfo"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/"* "$pkgdir/usr/lib/dinfo/"
    ln -s /usr/lib/dinfo/dinfo-linux-x64-self-contained "$pkgdir/usr/bin/dinfo"
}
