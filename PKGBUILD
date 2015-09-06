# Maintainer: Sid Karunaratne <sid@karunaratne.net>
_gemname=guard
pkgname=ruby-$_gemname
pkgver=2.6.1
pkgrel=1
pkgdesc="command line tool to easily handle events on file system modifications"
arch=('any')
url="http://guardgem.org/"
license=('MIT')
depends=('ruby' 'ruby-formatador>=0.2.4' 'ruby-listen>=2.7' 'ruby-lumberjack>=1.0' 'ruby-pry>=0.9.12' 'ruby-thor>=0.18.1')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
md5sums=('82162fdc54f9fd135042815449c84531')
sha1sums=('57d50382d10d12c8dac66d786c42eb88856b0d0a')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
