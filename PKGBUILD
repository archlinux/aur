# Maintainer: Rafal Vonau <rafal.vonau@gmail.com>
pkgname=wput-git
pkgver=0.6
pkgrel=1
pkgdesc="A command-line FTP-client for uploading files (RafalVonau fork)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/RafalVonau/wput"
license=('GPL')
depends=('glibc')
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc')
provides=('wput')
conflicts=('wput')
source=("${pkgname}::git+https://github.com/RafalVonau/wput.git")
sha256sums=('SKIP')


build() {
    cd "${pkgname}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
}
