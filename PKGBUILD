# Maintainer: David Phillips <dbphillipsnz gmail tod|dot com>

_gemname=grooveshark
pkgname=ruby-$_gemname
pkgver=0.2.11
pkgrel=1
pkgdesc="Unofficial ruby library for consuming the Grooveshark API"
arch=(any)
url="http://github.com/sosedoff/grooveshark"
license=('unknown')
depends=('ruby'
		 'ruby-json>=1.4.6'
		 'ruby-rest-client>=1.5.1'
		 'ruby-uuid>=2.0')
makedepends=(rubygems)
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('f106629bf0ef8d790a28dddad27cdb71e9e3b1579ea7ace41e97e06d31ca324be18bce030cdbef4dd43829406351a2f8c1a0d75de82a111ce2bd0bc98299c51d')

package() {
	cd "$srcdir"
	local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
	gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
