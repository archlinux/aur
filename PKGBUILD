# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

_gemname=mail
pkgname=ruby-$_gemname-2.5.3
pkgver=2.5.3
pkgrel=1
pkgdesc='Mail provides a nice Ruby DSL for making, sending and reading emails.'
arch=(any)
url='http://github.com/mikel/mail'
license=(MIT)
depends=(ruby ruby-mime-types-1 ruby-treetop-1.4 ruby-i18n)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem https://raw.githubusercontent.com/mikel/mail/master/MIT-LICENSE)
noextract=($_gemname-$pkgver.gem)
sha1sums=('0873049814d041071e4f26c7e3eb95af1573ceea'
          'f492b772aa4cfa1d1ea21613fc1eae4e5fac5d89')

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
	rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
	install -D -m644 MIT-LICENSE "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE"
}
