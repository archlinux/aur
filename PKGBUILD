# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Mariano Copetti <marianocopetti@gmail.com>

_appname_=remotelauncher
_filename_=${_appname_}server
pkgname=${_filename_}-bin
pkgver=0.2.16
pkgrel=3
pkgdesc="Remote Launcher is an easy to use tool that enables you to launch applications remotely on your PC via your Android phone. "
arch=("i686" "x86_64")
url="http://${_appname_}.sourceforge.net/"
license=("GPL")
depends=("java-runtime")
makedepends=()
source=("http://sourceforge.net/projects/${_appname_}/files/${pkgver}/${_filename_}-${pkgver}.tar.gz")

package() {
	cd ${srcdir}/${_filename_}-${pkgver}

	# Directories
	install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/${_filename_}/icons/

	# Files
	install -D -m755 Remote\ Launcher.jar ${pkgdir}/usr/share/${_filename_}/Remote\ Launcher.jar
	install -D -m755 remote-launcher-server ${pkgdir}/usr/share/${_filename_}/remote-launcher-server
	install -D -m755 remote-launcher-server.instdir ${pkgdir}/usr/share/${_filename_}/remote-launcher-server.instdir
	ln -s /usr/share/${_filename_}/remote-launcher-server.instdir ${pkgdir}/usr/bin/remote-launcher-server

	# Icons
	install -D -m644 icons/rl_launcher.png ${pkgdir}/usr/share/pixmaps/rl_launcher.png
	install -D -m644 icons/* ${pkgdir}/usr/share/${_filename_}/icons/
}

sha1sums=('e8034856ae9b51455efad40f51cf15f3548b8cae')
