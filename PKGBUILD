# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
pkgname=natron-plugins
pkgver=2.1.7
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/NatronVFX/natron-plugins"
license=("GPL2")
makedepends=("git")
depends=("natron" "python" "python2" "ffmpeg")
source=("$pkgname::git://github.com/NatronVFX/natron-plugins.git#tag=$pkgver")
md5sums=("SKIP")

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update -i --recursive
    #cd "OpenFX"
    #note : patch is only useful for 2.1.2 & lower. should be fixed in next release
    #patch -uNp1 -i $srcdir/GCC6.patch
   
}



package() {
    cd $srcdir/$pkgname/
    mkdir -p "$pkgdir/usr/share/Natron/Plugins"

    cp -r * $pkgdir/usr/share/Natron/Plugins/
}
