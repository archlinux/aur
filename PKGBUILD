# Maintainer: Reik Keutterling <spielkind at gmail dot com>

_gemname=iniparse
pkgname=ruby-$_gemname
pkgver=1.5.0
pkgrel=1
pkgdesc="IniParse is a pure Ruby library for parsing INI configuration and data files."
arch=(any)
url="https://github.com/antw/iniparse"
license=(MIT)
depends=(ruby ruby-bundler)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('739875d41f5d002f41eba8d38eacda4460da8159')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
