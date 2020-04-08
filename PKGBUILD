# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=facebook-cli
pkgver=1.7.1
pkgrel=1
pkgdesc='Facebook command line tool'
arch=('any')
url='https://github.com/specious/facebook-cli'
license=('ISC')
depends=('ruby'
		 'ruby-json'
		 'ruby-gli'
		 'ruby-jsonpath'
		 'ruby-koala')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=('$pkgname-$pkgver.gem')
md5sums=('fb289099fcbd8f28915d71c5e153c75f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}