# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=ruby-gli
_gemname=gli
pkgver=2.16.1
pkgrel=1
pkgdesc="Make awesome command-line applications the easy way"
arch=('any')
url="https://github.com/davetron5000/gli"
license=('APACHE')
depends=('ruby')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
md5sums=('b3983067656ddaeb937c5fdb8204b6cd')
