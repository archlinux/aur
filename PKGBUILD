# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll-gist
pkgname=ruby-$_gemname
pkgver=1.4.0
pkgrel=1
pkgdesc='Liquid tag for displaying GitHub Gists in Jekyll sites.'
arch=(any)
url='https://github.com/jekyll/jekyll-gist'
license=(MIT)
depends=('ruby' 'ruby-octokit>4.2')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
sha512sums=('df3917942a59509e9fb494587a882e5303a1fd86c680db21c15f6177e577bd5ba0017be3b6b7d08166712b4fcf3c163ce18fb1810d89e48f96a8be3e831135b9')
