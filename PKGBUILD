# Contributor: Nikita Nikishin <i.nnikishi@gmail.com>
# Contributor: Christian Mauderer <oss@c-mauderer.de>
pkgname=pdfbeads
pkgver=1.1.1
pkgrel=3
pkgdesc="A small utility written in Ruby which takes scanned page images and converts them into a single PDF file"
arch=(any)
url="http://rubygems.org/gems/pdfbeads"
license=('GPL')
depends=('ruby' 'ruby-nokogiri>=1.5.10' 'ruby-pdf-reader>=1.0.0' 'ruby-rmagick>=2.13.0' )
makedepends=(rubygems)
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('5aa0a7c57e6ce683a5bd4eb1a5d9eb76')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install \
    --no-user-install \
    --ignore-dependencies \
    --verbose \
    -i "$pkgdir$_gemdir" \
    -n "$pkgdir"/usr/bin \
    "$pkgname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
