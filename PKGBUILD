# Maintainer: Xiang Gao <qasdfgtyuiop@gmail.com>

_gemname=jekyll-redirect-from
pkgname=ruby-$_gemname
pkgver=0.11.0
pkgrel=1
pkgdesc='A simple, blog aware, static site generator.'
arch=(any)
url='https://github.com/jekyll/jekyll'
license=(MIT)
depends=('ruby' 'ruby-jekyll')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('dad7c70b0b1ced5cfbe30a17e68388a8718db896d09496331fe77d803c0a63ce3d41617f8cb98d4d92bb6186cec9e0b0f53486b2715e3ff44ba2489593b192f3')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  #install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
