# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=friends
_gemname=$pkgname
pkgver=0.51
pkgrel=1
pkgdesc="Spend time with the people you care about. Introvert-tested. Extrovert-approved."
arch=('any')
url="https://github.com/JacobEvelyn/friends"
license=(MIT)
depends=('ruby' 'ruby-chronic' 'ruby-gli' 'ruby-paint' 'ruby-tty-pager')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("${pkgname}-${pkgver}.gem")
sha512sums=('df94c06366194a08f3ca68c1638aaf35006d0d1998bd8424cecdcc073529f8c41180587bb3eac47b88aa149a5c2954037ddb1af2da84ffa6a3dc953f5f5cea3b')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
