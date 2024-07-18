# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=ruby-gli
_gemname=gli
pkgver=2.21.4 # renovate: datasource=rubygems depName=gli
pkgrel=1
pkgdesc="Make awesome command-line applications the easy way"
arch=('any')
url="https://github.com/davetron5000/gli"
license=('Apache-2.0')
depends=('ruby')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("${_gemname}-${pkgver}.gem")
md5sums=('dfba911f5af63f2e0969f0d276827874')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
