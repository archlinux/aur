# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname=mime-types
pkgname=ruby-${_gemname}-1
pkgver=1.25.1
pkgrel=2
pkgdesc='A library and registry for information about MIME content type definitions'
arch=(any)
url='http://mime-types.rubyforge.org/'
license=(MIT 'Artistic 2.0' GPL-2)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('88ef3c596481678710ffd4018fa40f1999b02d97babea39682ba7d5badd21f56')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

