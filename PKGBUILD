# Contributor: Nikita Nikishin <i.nnikishi@gmail.com>
# Contributor: Christian Mauderer <oss@c-mauderer.de>
# Contributor: Jonas Strassel <jo.strassel@gmail.com>

pkgname=pdfbeads
pkgver=v1.1.2.pre.beta
pkgrel=0
pkgdesc="A small utility written in Ruby which takes scanned page images and converts them into a single PDF file"
arch=(any)
url="http://rubygems.org/gems/pdfbeads"
license=('GPL')

depends=(
'ruby>=2.0.0'
'jbig2enc-git'
'openjpeg2'
)

optdepends=(
'ruby-iconv>=1.0.0'
'ruby-nokogiri>=1.7.0.0'
'ruby-rmagick>=2.0.0'
)

makedepends=(ruby)
source=(https://github.com/boredland/pdfbeads/releases/download/$pkgver/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
md5sums=('68beffdd3b50d581a5325e68d43999c2')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install \
    --no-user-install \
    --verbose \
    -i "$pkgdir$_gemdir" \
    -n "$pkgdir"/usr/bin \
    "$pkgname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et: