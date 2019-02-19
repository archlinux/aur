# Maintainer: <gaelic>

_gemname=asciidoctor-pdf
pkgname=asciidoctor-pdf
pkgver=1.5.0.alpha.16
pkgrel=1
pkgdesc='translate asciidoctor directly to pdf'
arch=(any)
url='https://asciidoctor.org/'
license=()
depends=(asciidoctor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('0f6b2a1533577dfba218de5dd886771447e4d1cb670b81d2c3bf3a180e6029a1')
package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  # non-HEAD version should not install any files in /usr/bin
  rm -r "$pkgdir/usr/bin/"
}
