# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=timetrap
pkgver=1.15.2
pkgrel=1
pkgdesc='Timetrap is a simple command line time tracker written in ruby. It provides an easy to use command line interface for tracking what you spend your time on'
arch=('any')
url='https://github.com/samg/timetrap'
license=('MIT')
depends=('ruby'
		 'ruby-chronic'
		 'ruby-sequel'
		 'ruby-sqlite3')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=('$pkgname-$pkgver.gem')
md5sums=('c7c84dc593201b1764268ca46dc06c2c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}