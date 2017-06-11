# Maintainer: Jonne Haß <me@jhass.eu>
_gemname=pony
pkgname=ruby-$_gemname
pkgver=1.11
pkgrel=1
pkgdesc="Send email in one command: Pony.mail(:to => 'someone@example.com', :body => 'hello')"
arch=(any)
url='http://github.com/benprew/pony'
license=(MIT)
depends=(ruby ruby-mail)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('cb5c549c52a056943e51970b0742d312a208ec43')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
