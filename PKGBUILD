# Maintainer: SelfRef <arch@selfref.dev>

# INFO: Upstream binary is built with X11 support thus X11 dependencies are required.
#       To built version for Wayland only use either `deskflow` or `deskflow-git` package.

_basename=deskflow
pkgname=${_basename}-bin
pkgver=1.17.1
pkgrel=1
pkgdesc="Deskflow lets you share one mouse and keyboard between multiple computers"
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
	'tomlplusplus'
	# 'libx11' # dependency of libxtst
	# 'libxext' # dependency of libxtst
	# 'libxi' # dependency of libxtst
)
optdepends=(
	'openssl: TLS encryption'
	'gtk3: GTK file/dir picker'
)
provides=("$_basename")
conflicts=("$_basename")
source=("https://github.com/deskflow/deskflow/releases/download/v$pkgver/deskflow-$pkgver-arch-x86_64.pkg.tar.zst")
sha256sums=('eae8163c59ce8ac991eb1a9f59cb123b99ee350176693314e3489247397ef39b')

package() {
	mkdir "$pkgdir"/usr/
	cp -r usr/* "$pkgdir"/usr/
}
