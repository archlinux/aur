# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-loadpath
pkgver=1.0
pkgrel=2
pkgdesc="Add a system-wide package directory to the JULIA_LOAD_PATH"
arch=(any)
url="https://gitlab.manjaro.org/jonathon/$pkgname"
license=(GPL3)
optdepends=(julia)

source=($pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('56e8a0daa45ac8be6d82f2676f1dba942022e7455d63c6bf79e29131a827510b')

package() {
	cd $pkgname-$pkgver
	install -D julia-load-path.csh $pkgdir/etc/profile.d/julia-load-path.csh
	install -D julia-load-path.sh  $pkgdir/etc/profile.d/julia-load-path.sh

	echo << EOM "
	** NOTE **

	You must start a new shell (or source the profile script) after installing this
	package to set up the default JULIA_LOAD_PATH environment variable.

	If you don't, any other Julia packages will be unable to find system-wide modules.
"
EOM
}
