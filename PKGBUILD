# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=friends
pkgver=0.33
pkgrel=1
pkgdesc="Spend time with the people you care about. Introvert-tested. Extrovert-approved."
arch=('any')
url="https://github.com/JacobEvelyn/friends"
license=(MIT)
depends=('ruby')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/${pkgname}-${pkgver}.gem")
noextract=("${pkgname}-${pkgver}.gem")
md5sums=('df6444e78732bea0a0da1b41e673d765')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
}
