# Contributor: Nikita Nikishin <i.nnikishi@gmail.com>
# Contributor: Christian Mauderer <oss@c-mauderer.de>
pkgname=pdfbeads
pkgver=1.0.9
pkgrel=2
pkgdesc="A small utility written in Ruby which takes scanned page images and converts them into a single PDF file"
arch=(any)
url="http://rubygems.org/gems/pdfbeads"
license=('GPL')
depends=('ruby' 'imagemagick' 'ruby-rmagick>=2.13.1' 'jbig2enc-git' 'ruby-iconv' )
makedepends=(rubygems)
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('bd4c1d2ecf7436ab45f882e10f8129b6')

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
