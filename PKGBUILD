# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=mina
pkgname=ruby-$_gemname
pkgver=0.3.7
pkgrel=1
pkgdesc='Really fast deployer and server automation tool.'
arch=('any')
url='http://github.com/nadarei/mina'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby' 'ruby-open4' 'ruby-rake')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('bd1fa2b56ed1aded882a12f6365a04496f5cf8a14c07f8c4f1f3cfc944ef34f6')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
