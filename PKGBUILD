# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=ip2location-ruby
pkgver=7.0.0
pkgrel=1
pkgdesc="Ruby library enables the user to find info of any IP address or hostname"
arch=(any)
url="http://www.ip2location.com/developers/ruby"
license=('GPL3')
depends=('ruby' 'rubygems')
source=("http://www.ip2location.com/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('27880b6ff5917c74f64f9dfd60eac311d075200eb63a23e35ab51ae7c1c3fc1f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --install-dir "$pkgdir$_gemdir" ip2location_ruby
}
