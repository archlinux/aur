pkgname=ragetype
pkgver=v1.1
pkgrel=1
pkgdesc="Ragetype is a simple POSIX compliant program written in C for the gnu/linux operating system and similar Unix-linux systems."
arch=('x86_64')
url="https://git.cheemsbread.xyz/CheemsBread/ragetype"
license=('GPLv2')
source=("$url/archive/$pkgver.tar.gz")

# Add the checksum for your source file
sha256sums=('78340026e342057a7ce202d21185348eb9ff540c87332a9b1df1c1763e15d857')

makedepends=('musl')  # Add musl-gcc as a build dependency

build() {
    cd "$srcdir/ragetype"
    musl-gcc src/main.c -o $pkgname
}

package() {
    cd "$srcdir/ragetype"
    sudo mv $pkgname /usr/bin
}

