# Contributor: Ivy Foster <code@escondida.tk>

pkgname=lua-cosmo-git
pkgver=9.02.22.r35.ge774f08
pkgrel=1
pkgdesc='Safe templates for Lua'
arch=(i686 x86_64)
url='http://cosmo.luaforge.net/'
license=(MIT)

depends=(lua lua-lpeg)
makedepends=(luarocks)

provides=(lua-cosmo)
conflicts=(lua-cosmo)

source=('git+https://github.com/mascarenhas/cosmo.git')
md5sums=(SKIP)

pkgver() {
	cd cosmo
	git describe | sed 's,v,,; s,-\(.*\)-,.r\1.,'
}

package() {
	cd cosmo
	luarocks --tree="$pkgdir/usr" install --deps-mode=none cosmo
	find "$pkgdir/usr" -name manifest -delete
}
