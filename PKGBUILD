# Maintainer: Samuel Martin Moro <samuel@peerio.com>
pkgname=peerio-client
pkgver=1.4.1
pkgrel=1
pkgdesc="Peerio Client"
arch=('i686' 'x86_64')
url='https://peerio.com'
license=('GPL3')
depends=('alsa-lib' 'glibc' 'cairo' 'libdbus' 'fontconfig' 'gconf' 'gdk-pixbuf2' 'gtk3' 'libnotify' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango')
makedepends=('curl' 'fakeroot' 'git' 'make' 'npm' 'patch' 'python-pip' 'sudo')
options=('!strip')
#source=('http://linux.peerio.com/sources/${pkgname}-${pkgver}.tar.gz')
source=('http://linux.peerio.com/sources/peerio-client-1.4.1.tar.gz')
md5sums=('3205534eabb7139302352a3584d303f0')
build() {
    cd "${srcdir}/${pkgname}"
    curl http://linux.peerio.com/sources/05-build.patch >build.patch
    patch -p0 <build.patch && rm -f build.patch
    make client
}
package() {
    cd "${srcdir}/${pkgname}"
    make install PREFIX="${pkgdir}/usr/share" BINPREFIX="${pkgdir}/usr"
}
