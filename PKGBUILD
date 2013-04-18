# Contributor: oliparcol <oliparcol AT gmail DOT com>
pkgname=ruby-posix-spawn
pkgver=0.3.6
pkgrel=2
pkgdesc="posix-spawn uses posix_spawnp(2) for faster process spawning"
arch=(any)
url="https://github.com/rtomayko/posix-spawn"
license=('MIT')
depends=(ruby)
makedepends=(rubygems)
source=(http://rubygems.org/downloads/posix-spawn-$pkgver.gem 
        LICENSE)
md5sums=('fd3903ab505d19aadbec5d3baa0d9449'
         '0c1a6d29e061ff630dc8294b815f28c3')
noextract=(posix-spawn-$pkgver.gem)

build() {
        cd $srcdir
        local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

        gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" posix-spawn-$pkgver.gem

        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
