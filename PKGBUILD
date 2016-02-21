# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll-sass
pkgname=ruby-$_gemname
pkgver=1.2.2
pkgrel=1
pkgdesc='Sass CSS converter for Jekyll'
arch=('any')
url='http://github.com/noct/jekyll-sass'
license=()
depends=('ruby' 'ruby-colorator>=0.1' 'ruby-jekyll>0.10.0' 'ruby-sass>=3.0.0')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha512sums=('845d55e79ed96e0f848ed23bb19a2b87cb01b2e135e728f33d2ae82f4138edc4d2416ee0d33bedee681058c0d473586ae5f8af089378573fc66f41ce590509e0')
