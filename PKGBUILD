# ruby-rest-client

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

# Contributor: David Phillips <dbphillipsnz@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=ruby-rest-client
_pkgname=${pkgname#*-}
pkgver=2.1.0
pkgrel=2
pkgdesc='Simple HTTP and REST client for Ruby, inspired by Sinatra'
arch=('any')
url='https://github.com/rest-client/rest-client'
license=('MIT')
depends=(
    'ruby>=2.0'
    'ruby-http-cookie>=1.0.2'
    'ruby-mime-types>=1.16'
    'ruby-netrc>=0.8'
)
makedepends=(
    'rubygems'
    'ruby-webmock>=2.0'
    'ruby-rspec>=3.0'
    'ruby-pry'
    'ruby-rdoc>=2.4.2'
    'ruby-rubocop>=0.49'
)
source=("https://rubygems.org/downloads/$_pkgname-$pkgver.gem")
noextract=("$_pkgname-$pkgver.gem")
sha256sums=('35a6400bdb14fae28596618e312776c158f7ebbb0ccad752ff4fa142bf2747e3')

package() {
	local _gemdir=$(ruby -e 'puts Gem.default_dir')

	gem install \
		--ignore-dependencies \
		--no-user-install \
		-i "$pkgdir/$_gemdir" \
		-n "$pkgdir/usr/bin" \
		"$_pkgname-$pkgver.gem"

	rm "$pkgdir$_gemdir/cache/$_pkgname-$pkgver.gem"
}
