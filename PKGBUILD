# Maintainer: Filipe Nascimento <flipee at tuta dot io>

_gemname=xdg
pkgname=ruby-xdg5
pkgver=5.3.0
pkgrel=1
pkgdesc="Provides a Ruby implementation of the XDG Base Directory Specification (version 5.x)"
arch=('any')
url="https://www.alchemists.io/projects/xdg"
license=('Apache')
depends=('ruby')
makedepends=('ruby-rdoc')
conflicts=('ruby-xdg')
options=(!emptydirs)
source=("http://rubygems.org/downloads/xdg-$pkgver.gem")
noextract=("xdg-$pkgver.gem")
sha256sums=('9b7fbaf36169a7ef53e0d024b7d2f9e2636bbd805b6d903f78269882b48476ff')

package() {
    local _gemdir
    _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
