pkgname=ragetype
pkgver=v1.0
pkgrel=1
pkgdesc="Ragetype is a simple POSIX compliant program written in C for the gnu/linux operating system and similar Unix-linux systems."
arch=('x86_64')
url="https://git.cheemsbread.xyz/CheemsBread/ragetype"
license=('GPLv2')
source=("$url/archive/$pkgver-beta.tar.gz")

# Add the checksum for your source file
sha256sums=('eb7de1029678bd60f93ab0af81b9483da5a4c534d02f66852f955a8536772a11')

makedepends=('musl')  # Add musl-gcc as a build dependency

build() {
    cd "$srcdir/ragetype"
    musl-gcc src/main.c -o $pkgname
}

package() {
    cd "$srcdir/ragetype"
    sudo mv $pkgname /usr/bin
}

