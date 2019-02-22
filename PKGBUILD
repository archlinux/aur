# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=ruby-json
pkgver=2.2.0
pkgrel=1
pkgdesc="This is a JSON implementation as a Ruby extension in C"
arch=('x86_64')
url='http://json-jruby.rubyforge.org/'
license=('Ruby')
depends=('ruby')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('855d5cbeb6e62a7deb009ad454944430c0370cc98c53a1126d8ca3cac4b11a191bfb2ded84a957d4caa0f59cc9b6308e320a58569bddba8d6984078ea34703f2<Paste>')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/${pkgname#ruby-}-$pkgver.gem"
}
