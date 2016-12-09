# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Severen Redwood <severen at shrike dot me>

_gemname='thor'
pkgname=ruby-$_gemname
pkgver=0.19.4
pkgrel=1
pkgdesc='Thor is a toolkit for building powerful command-line interfaces.'
arch=('any')
license=('MIT')
makedepends=('ruby')
url='http://whatisthor.com/'
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
sha256sums=('da8aa62e197c5c203d9dc3db06314abdab2d8dc9807d0094a9c0503cd36ec506')
noextract=("$_gemname-$pkgver.gem")

package() {
  cd "$srcdir"
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
}
