# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=puppet-lint
pkgver=2.3.3
pkgrel=2
pkgdesc="Check that your Puppet manifests conform to the style guide."
arch=('i686' 'x86_64')
url="https://github.com/rodjek/puppet-lint"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('8d3f294b1220253580ec7b19ff8a88e2065566d3da47adbefd88a7e178796e23')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
}
