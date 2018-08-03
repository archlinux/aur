# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=lyricue
pkgver=4.0.12
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
source=("https://github.com/cjd/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e88aefc03c0dfae9d361ef8590ad32dcb1e2cc20b8549e7d47402ba4f274a2e3')

prepare () {
    cd "${pkgname}-${pkgname}-${pkgver}"
    ./autogen.sh --prefix=/usr
}

build() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    make
}

check() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    make -k check
}

package() {
    cd "${pkgname}-${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
