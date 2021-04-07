# Maintainer: Abhishek "Abh15h3k" Banerji <abhishekbanerji1999@gmail.com>

pkgname="slock-abh15h3k"
pkgver=1.4.d3598d9
pkgrel=1
pkgdesc="my build of suckless slock. with image patch"
url="https://github.com/Abh15h3k/slock"
arch=("x86_64")
depends=("bzip2" "freetype2" "glib2" "glibc" "graphite" "harfbuzz" "imlib2" "libpng" "libx11" "libxau" "libxcb" "libxcrypt" "libxdmcp" "libxext" "libxrandr" "libxrender" "pcre" "zlib")
makedepends=("git" "make")
license=("MIT")
provides=("slock")
conflicts=("slock")
source=("slock-abh15h3k::git+https://github.com/Abh15h3k/slock-abh15h3k")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/slock-abh15h3k"
    commit=$(git log --pretty=format:"%h" | head -n1)
    echo "1.4.${commit}"
    # git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/slock-abh15h3k"
    # mkdir build -p && cd build
    # cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/slock-abh15h3k"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    # install -Dsm 755 build/ryzenadj $pkgdir/usr/bin/ryzenadj
    # install -Dsm 744 build/libryzenadj.so $pkgdir/usr/lib/libryzenadj.so
}
