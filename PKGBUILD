# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=ruby-tty-which
_gemname=tty-which
pkgver=0.4.2
pkgrel=1
pkgdesc="Cross-platform implementation of Unix which command"
arch=('any')
url="https://github.com/piotrmurach/tty-which"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("${_gemname}-${pkgver}.gem")
md5sums=('2418a6f6dbe3eda6d1af13c11b3e4f3e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
