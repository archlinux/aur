# Maintainer: SelfRef <arch@selfref.dev>

# INFO: Upstream binary is built with X11 support thus X11 dependencies are required.
#       To built version for Wayland only either `deskflow` or `deskflow-git` package.

_basename=deskflow
pkgname=${_basename}-bin
pkgver=1.17.0
pkgrel=3
pkgdesc="Deskflow lets you share one mouse and keyboard between multiple computers (binary version)"
arch=('x86_64')
url="https://deskflow.org/"
license=('GPL-2.0')
depends=(
	'libxtst'
	'libxkbcommon'
	'libxkbcommon-x11'
	'libnotify'
	'libxkbfile'
	'libxinerama'
	'libxrandr'
	'libei'
	'libportal=0.6'
	'qt6-base'
	'gdk-pixbuf2'
	'pugixml'
	# 'libx11' # dependency of libxtst
	# 'libxext' # dependency of libxtst
	# 'libxi' # dependency of libxtst
)
optdepends=(
	'openssl: TLS encryption'
	'gtk3: GTK file/dir picker'
)
provides=("$_basename")
conflicts=("$_basename" 'synergy')
source=("https://github.com/deskflow/deskflow/releases/download/v$pkgver/deskflow_${pkgver}+r1_fedora-40_amd64.rpm")
sha256sums=('26b78af06f60f18764871c28560620d5f90928b812c62188aeb1fad598b0dba5')

package() {
	mkdir "$pkgdir"/usr/
	cp -r usr/bin usr/share "$pkgdir"/usr/
}
