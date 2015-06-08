# $Id$
# Maintainer: Ian Hernandez <ihernandezs@openmailbox.org>

pkgname=markdown-reader
pkgver=1.1.0
pkgrel=4
pkgdesc="A document reader for markdown and html files"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/BadWolfie"
depends=('gtk3' 'webkit2gtk' 'python-markdown')
makedepends=('vala' 'git' 'intltool')
options=('!emptydirs')
source=("$pkgname-$pkgver::git+$url/$pkgname.git")
md5sums=('SKIP')
install=$pkgname.install

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
