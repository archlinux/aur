# Maintainer: farwayer <farwayer@gmail.com>

_name=excon
_v=0.67.0
_r=2
_gem=$_name-$_v.gem

pkgname=ruby-$_name
pkgver=$_v
pkgrel=$_r
pkgdesc="EXtended http(s) CONnections"
arch=('any')
url="https://github.com/geemus/excon"
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
source=(http://rubygems.org/downloads/$_gem)
noextract=($_gem)
sha256sums=('e264d6eeb58a8b1f5e2e6bf0c1edd5376c134be942e03dd63262ba48e01347ec')

package() {
  local _gemdir="$pkgdir/$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$_gemdir" "$_gem"
  rm "$_gemdir/cache/$_gem"
  install -D -m644 "$_gemdir/gems/$_name-$_v/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
