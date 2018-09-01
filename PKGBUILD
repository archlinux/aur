# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lyricue
pkgver=4.0.13
pkgrel=1
pkgdesc='GNU Lyric Display System, server and client'
arch=('x86_64' 'armv6h')
url='https://www.lyricue.org'
license=('GPL')
depends=('clutter'
        'clutter-gst'
        'clutter-gtk'
        'gnome-perl'
        'pango-perl'
        'perl-class-accessor'
        'perl-class-accessor-lvalue'
        'perl-dbd-mysql'
        'perl-dbi'
        'perl-file-mimeinfo'
        'perl-gtk3'
        'perl-locale-gettext'
        'perl-module-pluggable'
        'perl-net-rendezvous-publish'
        'perl-uri'
        'perl-want'
        'perl-xml-simple')
makedepends=('gcc'
        'intltool'
        'libmariadbclient')
optdepends=('mariadb'
        'perl-gtk3-trayicon'
        'perl-net-bonjour')
source=("https://github.com/cjd/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ebe494a9c46bef42d247987f9c25e888e8b39a4f72166e6475eaf8817aefce1d')

prepare () {
    cd "$pkgname-$pkgver"
    ./autogen.sh --prefix=/usr
}

build() {
    cd "$pkgname-$pkgver"
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
