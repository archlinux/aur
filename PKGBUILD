# Maintainer: Hugo Courtial <hugo [at] courtial [not colon] me>
pkgname=natron-plugins
pkgver=2.1.7
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/olear/openfx-arena/tree/Natron-$pkgver"
license=("GPL2")
makedepends=("git")
depends=("swig" "swig2" "boost" "boost-libs" "freetype2" "openexr" "libraw" "openjpeg" "graphviz" "libxt" "bzip2" "libtool" "libcaca" "libjpeg" "libtiff" "glew"  "libpng" "lcms" "gcc-libs-multilib" "imagemagick" "libcdr" "librsvg" "libtool" "libzip" "opencolorio" "poppler-glib" )
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
