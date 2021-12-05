# Maintainer: Brian Bidulock <bidulock@openss7.org>
_gemname=jekyll-theme-minimal
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc='A minimal Jekyll theme for GitHub Pages'
arch=(any)
url='https://github.com/pages-themes/minimal'
license=(CC0)
depends=(ruby jekyll ruby-jekyll-seo-tag)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha1sums=('0b84b93333d664b01d8d37ab2953d48c61bd6d76')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
