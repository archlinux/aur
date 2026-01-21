# Maintainer: Sterophonick
pkgname=gamescope-shaders-git
_pkgname='gamescope-shaders-git'
pkgver=0.1.r2.g64d7a05
pkgrel=1
pkgdesc='Gamescope shaders for SteamOS'
url='https://github.com/misyltoad/GamescopeShaders'
arch=(any)
depends=(gamescope-session-git)
source=(git+https://github.com/misyltoad/GamescopeShaders)
md5sums=('SKIP')
license=('gplv3')

pkgver() {
  cd "$srcdir/GamescopeShaders"
  git describe --tags --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -d "$pkgdir"/usr/share/gamescope/reshade
	cp -r "$srcdir"/GamescopeShaders/* "$pkgdir"/usr/share/gamescope/reshade/
	chmod -R 655 "$pkgdir"/usr/share/gamescope
}
