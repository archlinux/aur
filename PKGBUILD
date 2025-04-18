# Maintainer: Ruby quarry (https://github.com/anatol/quarry)

_gemname=native-package-installer
pkgname=ruby-$_gemname
pkgver=1.1.9
pkgrel=3
pkgdesc='A helper to install native packages on "gem install"'
arch=(any)
url=https://github.com/ruby-gnome2/native-package-installer
license=(LGPL3)
depends=(ruby)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('fbb41b6b22750791a4304f0a0aeea3dd837668892117f49c4caf2e8e0f4e792f')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
