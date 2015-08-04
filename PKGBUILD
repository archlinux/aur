# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=mime-types
pkgname=ruby-${_gemname}-1
pkgver=2.6.1
pkgrel=1
pkgdesc='A library and registry for information about MIME content type definitions'
arch=(any)
url='http://mime-types.rubyforge.org/'
license=(MIT 'Artistic 2.0' GPL-2)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5b16d655397aa5cd8b4108494f60f64b4e18a2c92dc9257ff74ec64284dbd9ee')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

