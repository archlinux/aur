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
depends=('ruby' 'ruby-octokit')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('495b6483552a3e2975a2752964ea7acddd545bc6e13ce2be15a50cec8d4c9f0f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
