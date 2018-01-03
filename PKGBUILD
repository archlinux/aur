# Maintainer: Ruby quarry (https://github.com/anatol/quarry)

_gemname=native-package-installer
pkgname=ruby-$_gemname
pkgver=1.0.6
pkgrel=2
pkgdesc=native-package-installer\ helps\ to\ install\ native\ packages\ on\ \"gem\ install\"
arch=(any)
url=https://github.com/ruby-gnome2/native-package-installer
license=(LGPL3)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('b49175bbb84cfcaebdc981a3c099383180cfda73')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
