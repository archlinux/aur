# Maintainer: Colin Arnott <colin@urandom.co.uk>

_gemname=unf_ext
pkgname=ruby-$_gemname
pkgver=0.0.7.4
pkgrel=1
pkgdesc="Unicode Normalization Form support library for CRuby"
arch=(any)
url="https://github.com/knu/ruby-unf_ext"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
optdepends=('ruby-bundler' 'ruby-rake' 'ruby-rakecompiler' 'ruby-rdoc' 'ruby-test-unit')
source=(https://rubygems.org/downloads/${pkgname#ruby-}-$pkgver.gem)
noextract=(${pkgname#ruby-}-$pkgver.gem)
sha512sums=('2f90542c899e02c2cae06b54ad381ba0f2084880cb760357b4cedf7f171aa2eb7322a0288fadd253624c531410730624a4c8d51e5eb61a67b3fd91d985847fbb')

package() {
  cd "$srcdir"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" -n "$pkgdir/usr/bin" "${pkgname#ruby-}-$pkgver.gem"
}
