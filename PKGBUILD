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
source=("${pkgname}-${pkgver}.gem::https://rubygems.org/downloads/$pkgname-$pkgver.gem")
noextract=('$pkgname-$pkgver.gem')
sha256sums=('fb5f70bec4bff21c1f1f290f2bc85567b8616db6c84afdc9e584a06b367f339a')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}