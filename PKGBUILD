# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=commonjs
pkgname=ruby-$_gemname
pkgver=0.2.7
pkgrel=1
pkgdesc='Provide access to your Ruby and Operating System runtime via the commonjs API'
arch=('any')
url='https://github.com/cowboyd/commonjs.rb'
license=()
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
sha512sums=('a8cbfbea296b56bc7a8982fc6a940b2d72089960f425bfa1a2c2ed4569cbff5f797f072aef311cc5011db02b5a13852703366476c50a6436cbd4d142e128bdb8')
