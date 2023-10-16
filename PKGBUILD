# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Luca Cesari < luca AT cesari DOT me>

_gemname=xdg
pkgname=ruby-xdg
pkgver=7.1.2
pkgrel=1
pkgdesc="Provides a Ruby implementation of the XDG Base Directory Specification"
arch=('any')
url="https://www.alchemists.io/projects/xdg"
license=('Apache')
depends=('ruby>=3.1')
makedepends=('ruby-rdoc')
options=(!emptydirs)
source=("http://rubygems.org/downloads/xdg-$pkgver.gem")
noextract=("xdg-$pkgver.gem")
sha256sums=('acd74e7e9a1bad7d455844e7ad1da6da8a31947d4875bb2c911a3ef6eb0e4d00')

package() {
    local _gemdir
    _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
