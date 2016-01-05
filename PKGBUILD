# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

_gemname=ppl
pkgname=ruby-$_gemname
pkgver=2.3.3
pkgrel=1
pkgdesc='The command line address book'
arch=(any)
url='http://ppladdressbook.org'
license=(MIT)
depends=(ruby ruby-colored ruby-inifile-2 ruby-mail-2.5.3 ruby-morphine ruby-rugged-0.17.0.b6 ruby-greencard)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('1841e730d84e58b56ce6cc4dea63a83df10498ab')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
