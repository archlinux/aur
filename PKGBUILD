# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=logging
pkgname=ruby-$_gemname
pkgver=2.1.0
pkgrel=1
pkgdesc='Logging is a flexible logging library for use in Ruby programs'
arch=(any)
url='http://rubygems.org/gems/logging'
depends=('ruby' 'ruby-little-plugger>=1.1' 'ruby-multi_json>=1.10')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha512sums=('e8aad48ef24f8f70fad2aa4d78c25cb675b8c65ea883e14f6e2697af79111de38bced389d2f20d5699bc722274268ddac835c34f89884ea0aee86571a7ca1b55')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
