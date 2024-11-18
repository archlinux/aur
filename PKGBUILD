# Maintainer: envolution
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Vojtech Aschenbrenner <v@asch.cz>

_gemname=xapian-ruby
pkgname=ruby-xapian-ruby
pkgver=1.4.22
pkgrel=1
pkgdesc='Xapian libraries and Ruby bindings'
arch=('i686' 'x86_64')
url="https://rubygems.org/gems/$_gemname"
license=('MIT')
depends=(
  'ruby'
  'xapian-core>=1:1.4.18'
)
makedepends=('ruby-rake' 'ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('026a866b431a96e6503ca2090cd5090aef564f37efd21bb5b2f6e8a8c57c9f76')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
