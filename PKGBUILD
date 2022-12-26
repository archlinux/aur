# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

_gemname=rbvmomi2
pkgname=ruby-$_gemname
pkgver=3.5.0
pkgrel=1
pkgdesc='Ruby interface to the VMware vSphere API'
arch=(any)
url='https://rubygems.org/gems/rbvmomi2'
license=(MIT)
depends=(ruby-builder ruby-json ruby-nokogiri ruby-optimist)
options=(!emptydirs)
conflicts=(ruby-rbvmomi)
provides=(ruby-rbvmomi)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c609474f0bb8f7ea6403de11a640ae7082f011facd8c8e12843265a8d450f019')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}


