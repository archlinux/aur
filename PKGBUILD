# Maintainer: Noah Rahimzadagan <noah.rahimzadagan@protonmail.com> 
pkgname=byteblitz
pkgver=1.0.0  
pkgrel=3
pkgdesc="A CLI tool for viewing the binary content of files."
url='https://github.com/noahra/byteblitz'
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')
arch=('x86_64')  
license=('GPL3')  
makedepends=('cargo' 'git')  
depends=()  

pkgver() {
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/byteblitz "$pkgdir/usr/bin/byteblitz"
}

