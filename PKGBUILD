# Maintainer: Tom Vincent <aur@tlvince.com>
pkgname=ruby-tty-pager
_gemname=tty-pager
pkgver=0.12.1
pkgrel=1
pkgdesc="Terminal output paging - cross-platform, major ruby interpreters"
arch=('any')
url="https://github.com/piotrmurach/tty-pager"
license=('MIT')
depends=('ruby' 'ruby-tty-screen' 'ruby-tty-which' 'ruby-strings')
makedepends=('rubygems')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha512sums=('078f90fd629acf2c5ee2abda5ba14249118f71b6cc0c6ccde10751bb3922ae2ce19a490d0ecf3639ad3377056b6e57ab86738972e39ede60d141950b8a953509')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
