# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-rokoko-motion-library
pkgver=1.1.3
pkgrel=1
pkgdesc='Autodesk Maya Rokoko Motion Library Plugin'
arch=('x86_64')
url='https://www.rokoko.com/motion-library'
license=('custom')
depends=('bzip2' 'curl' 'double-conversion' 'e2fsprogs' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite'
         'harfbuzz' 'icu' 'keyutils' 'krb5' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libidn2' 'libnghttp2'
         'libpng' 'libpsl' 'libssh2' 'libunistring' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'lz4' 'md4c' 'openssl'
         'pcre' 'pcre2' 'qt5-base' 'qt5-declarative' 'qt5-svg' 'systemd-libs' 'xz' 'zlib' 'zstd' 'maya=2020.4')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://RokokoMotionLibraryMaya-$pkgver-1.x86_64.rpm")
sha256sums=('244959bce47192a10a718c29a77d7cd22c4de2d5c0ea30c0c715531f11419848')

options=(!strip)

package() {
    # Install mod File
    echo "+ Rokoko $pkgver /usr/autodesk/maya2020/plug-ins/rokoko-motion-library" > usr/autodesk/modules/maya/2020/rokoko.mod
    install -D -m 644 usr/autodesk/modules/maya/2020/rokoko.mod $pkgdir/usr/autodesk/maya2020/modules/rokoko.mod

    # Copy Plugin Files
    mkdir -p $pkgdir/usr/autodesk/maya2020/plug-ins/rokoko-motion-library
    cp -a opt/rokoko_motion_library/maya/2020/* $pkgdir/usr/autodesk/maya2020/plug-ins/rokoko-motion-library/
}
