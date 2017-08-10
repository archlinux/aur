# Maintainer : Shawn Dellysse sdellysse@gmail.com
pkgname=parsec-bin
pkgver=131_4
pkgrel=1
pkgdesc="Remotely connect to a gaming pc for a low latency remote computing experience"
url=http://parsec.tv
arch=('x86_64')
provides=('parsec')
conflicts=('parsec')
depends=('glibc' 'pulseaudio-module-sndio')
source=("https://s3.amazonaws.com/parsec-build/package/parsec-linux.deb")
noextract=('parsec-linux.deb')
package() {
    ar p parsec-linux.deb src/data.tar.xz | tar xJ
    install -D --mode=0755 ${srcdir}/usr/bin/parsec ${pkgdir}/usr/bin/parsec
    install -D --mode=0644 ${srcdir}/usr/share/applications/parsec.desktop ${pkgdir}/usr/share/applications/parsec.desktop
    install -D --mode=0644 ${srcdir}/usr/share/icons/hicolor/256x256/apps/parsec.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/parsec.png
}
md5sums=('0283e54e5943b8c2550818d16dd7fe93')
