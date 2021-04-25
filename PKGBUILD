# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_gemname=serverengine
pkgname=ruby-$_gemname
pkgver=2.2.3
pkgrel=2
pkgdesc='A framework to implement robust multiprocess servers'
arch=(x86_64)
url='https://github.com/treasure-data/serverengine'
license=(Apache)
depends=(ruby ruby-sigdump)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('20f36d60b3f9a01c3768c490db89b8adaade75fc16c1ba738135d24bb858f44c10ab5ff1d0b31f0a287b2ddb3a69f958eaa155e7a54a26bbe5b6a480e52c4325')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

