# Maintainer: Alex Zose <alexander.zosimidis[at]gmail[dot]com>

pkgname=gophish
pkgver=0.7.1
pkgrel=1
pkgdesc="Open-Source Phishing Framework"
url="https://getgophish.com/"
arch=("i686" "x86_64")
license=('MIT')
depends=('glibc')
install="gophish.install"
source_i686=("https://github.com/gophish/gophish/releases/download/$pkgver/$pkgname-v$pkgver-linux-32bit.zip")
sha512sums_i686=("d28b175b53662da1b1db4e26a544992475390fe8c7f73e6e8d3f84bb4fe4343cdbe407ffb7e717c57c5834b9a8bdd612638556a393b168ed024933bf67f40df7")
source_x86_64=("https://github.com/gophish/gophish/releases/download/$pkgver/$pkgname-v$pkgver-linux-64bit.zip")
sha512sums_x86_64=("b886672d799048e9c8dd335092360c697b28c25c0bb383d342cdcb28b10fa166dcc4c8308799e4b10648f84fd0dbd078b3ca1e1edf2da4cfa17394dffa64fee3")
source=("gophish.service")
sha512sums=("c712c7680f661d399d0613ad2ff5598f2ef6a7f385567b264b55675feee052718da009e0b9dd3c5b5b56f5ba1de0165860eee53eacbdcd939289d34f42e0e147")

package() {
        mkdir -p $pkgdir/usr/{bin,share{,/{doc,licenses}}/$pkgname,lib/systemd/system}
 
        cp -r $srcdir/{db,static,templates,config.json,VERSION} $pkgdir/usr/share/$pkgname/
        cp $srcdir/README.md $pkgdir/usr/share/doc/$pkgname/
        cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/
        cp $srcdir/$pkgname $pkgdir/usr/bin/
        cp $pkgname.service $pkgdir/usr/lib/systemd/system/
}
