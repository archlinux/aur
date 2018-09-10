# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll-gist
pkgname=ruby-$_gemname
pkgver=1.5.0
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
sha512sums=('0ebf8a1fef5649fb85d06b9d62becefeef53b2611621cc2bc9dcceae821a00e5cc86794a603c7971b192ac9efc0e603b32f4a192702d40c05243ff0c3fd8fa98')
