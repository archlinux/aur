# Generated with gembuild (https://github.com/mfinelli/gembuild)
# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

_gemname=memoizable
pkgname=ruby-$_gemname
pkgver=0.4.2
pkgrel=1
pkgdesc='Memoize method return values.'
arch=('any')
url='https://github.com/dkubb/memoizable'
license=('MIT')
options=(!emptydirs)
noextract=($_gemname-$pkgver.gem)
depends=('ruby' 'ruby-thread_safe')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('acf4d2280fea019318e61cfc5e69077dcb3c2126817ee596ffd76d0ddf5e826c')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
