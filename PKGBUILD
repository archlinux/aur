# Maintainer: SelfRef <arch@selfref.dev>

# INFO: Upstream binary is built with X11 support thus X11 dependencies are required.
#       To built version for Wayland only either `deskflow` or `deskflow-git` package.

_basename=deskflow
pkgname=${_basename}-bin
pkgver=1.17.0
pkgrel=4
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
	'libportal'
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
source=("https://github.com/deskflow/deskflow/releases/download/v$pkgver/deskflow-${pkgver}.0-2_fedora_40_amd64.rpm")
sha256sums=('35600106827fb24dce0efdc28f252a79fa45ad7108945cd8a0e7f719e5cc4767')

package() {
	mkdir "$pkgdir"/usr/
	cp -r usr/bin usr/share "$pkgdir"/usr/
}
