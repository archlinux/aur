# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=jekyll-less
pkgname=ruby-$_gemname
pkgver=0.0.4
pkgrel=1
pkgdesc='Less CSS converter for Jekyll'
arch=(any)
url='http://github.com/zroger/jekyll-less'
license=()
depends=('ruby' 'ruby-jekyll>=0.10.0' 'ruby-less>=2.0.5')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('fdb07513f58a876e3d0ad7a66f6d09826d3d5b4a13aa335c0a01540422e5a72a93a13db245ee3e9e337a65f7357ada3b71c00ade9f272a922074c5f7596bea14')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
