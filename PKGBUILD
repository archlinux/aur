# Maintainer: Samuel Martin Moro <samuel@peerio.com>
pkgname=peerio-client
pkgver=1.2.0
pkgrel=1
pkgdesc="Peerio Client"
arch=('i686' 'x86_64')
url='https://peerio.com'
license=('GPL3')
depends=('alsa-lib' 'glibc' 'cairo' 'libdbus' 'fontconfig' 'gconf' 'gdk-pixbuf2' 'gtk3' 'libnotify' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxtst' 'nspr' 'nss' 'pango')
makedepends=('fakeroot' 'make' 'npm' 'python-pip' 'sudo')
options=('!strip')
#source=('http://linux.peerio.com/sources/${pkgname}-${pkgver}.tar.gz')
source=('http://linux.peerio.com/sources/peerio-client-1.2.0.tar.gz')
md5sums=('1689a08b2ea368fbc376ca2ba6d41f91')
build() {
    cd "${srcdir}/${pkgname}"
    sed -i '/^[ \t]*winIco: /d' gulpfile.js
    make client
}
package() {
    cd "${srcdir}/${pkgname}"
    make install PREFIX="${pkgdir}/usr/share" BINPREFIX="${pkgdir}/usr"
}
