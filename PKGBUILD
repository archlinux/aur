# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

pkgname=gabutdm
pkgver=2.6.0
pkgrel=2
pkgdesc="Download manager with support for http, https, ftp, torrents and magnets."
arch=('x86_64')
url="https://github.com/gabutakut/gabutdm"
license=('LGPL-2.1-only')
makedepends=('meson' 'vala')
depends=('curl' 'json-glib' 'libadwaita' 'libcanberra' 'libgee' 'libsoup3' 'qrencode')
optdepends=('aria2: Bittorent and magnets support.')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gabutakut/gabutdm/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('a361af523cff8c4e28916f31007eb25f')

build() {
   cd "${pkgname}-${pkgver}"
   meson --prefix=/usr build
   ninja -C build
}

package() {
   cd "${pkgname}-${pkgver}"
   DESTDIR="${pkgdir}" ninja -C build install
   cd "${pkgdir}/usr/bin/"
   ln -s com.github.gabutakut.gabutdm gabutdm
}
