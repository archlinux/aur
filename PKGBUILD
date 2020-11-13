# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=maya-rokoko-motion-library
pkgver=1.1.2
pkgrel=1
pkgdesc='Autodesk Maya Rokoko Motion Library Plugin'
arch=('x86_64')
url='https://www.rokoko.com/motion-library'
license=('custom')
depends=('bzip2' 'curl' 'double-conversion' 'e2fsprogs' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite'
		'harfbuzz' 'icu' 'keyutils' 'krb5' 'libgcrypt' 'libglvnd' 'libgpg-error' 'libidn2' 'libnghttp2'
		'libpng' 'libpsl' 'libssh2' 'libunistring' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'lz4'
		'md4c' 'openssl' 'pcre' 'pcre2' 'systemd-libs' 'xz' 'zlib' 'zstd' 'maya>=2020')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://RokokoMotionLibraryMaya-$pkgver-1.x86_64.rpm")
sha256sums=('051d4701b6b8689460464322cedd4bfb6d6643c64a64a85b8784de35ec81a399')

options=(!strip)

package() {
	# Install mod File
	echo "+ Rokoko $pkgver /usr/autodesk/maya2020/plug-ins/rokoko-motion-library" > usr/autodesk/modules/maya/2020/rokoko.mod
	install -D -m 644 usr/autodesk/modules/maya/2020/rokoko.mod $pkgdir/usr/autodesk/maya2020/modules/rokoko.mod

	# Copy Plugin Files
	mkdir -p $pkgdir/usr/autodesk/maya2020/plug-ins/rokoko-motion-library
	cp -a opt/rokoko_motion_library/maya/2020/* $pkgdir/usr/autodesk/maya2020/plug-ins/rokoko-motion-library/
}

