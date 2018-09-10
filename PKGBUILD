# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>

_gemname=jekyll-data
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=1
pkgdesc='A plugin to read _config.yml and data files within Jekyll theme-gems'
arch=(any)
url='https://github.com/ashmaroli/jekyll-data'
license=(MIT)
depends=('ruby' 'jekyll')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('7cc7d79ef804afff77cc5c35c30173a80cf4ff543480c8195ce6ba8ce983e747')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
