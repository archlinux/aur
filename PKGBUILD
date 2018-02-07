# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=classifier-reborn
pkgname=ruby-$_gemname
pkgver=2.2.0
pkgrel=1
pkgdesc='A general classifier module to allow Bayesian and other types of classifications.'
arch=('any')
url='https://github.com/jekyll/classifier-reborn'
license=(LGPL)
depends=('ruby' 'ruby-fast-stemmer')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('971c1da590f99a90c92183e3a010c0c948def278')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
