pkgname=local-dns
pkgver=0.7
pkgrel=2
pkgdesc="DNS resolution wrapper allowing fake DNS addresses mapped to devices by MAC address."
arch=(x86_64)
url="https://github.com/Student-Team-Projects/Local-DNS.git"
license=('GPL')
depends=('glibc' 'libpcap' 'nlohmann-json' 'libcrafter-git') # libcrafter is part of AUR
makedepends=('git' 'make' 'gcc>=10' 'autoconf' 'systemd')
source=("git+$url")
sha256sums=('SKIP')  # Replace 'SKIP' with actual checksums for security


prepare() {
    cd "$srcdir/Local-DNS"
}

build() {
    cd "$srcdir/Local-DNS"
    make main
}

package() {
    cd "$srcdir/Local-DNS"
    make DESTDIR="$pkgdir" install
}

install() {
    # Systemd hooks are managed via the .install file.
    :
}