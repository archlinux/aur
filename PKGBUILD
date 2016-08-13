# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=puppet-lint
pkgver=2.0.0
pkgrel=1
pkgdesc="Check that your Puppet manifests conform to the style guide."
arch=('i686' 'x86_64')
url="https://github.com/rodjek/puppet-lint"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('90f2b3c84cd569aebd9b3f2709bd59c0b92e0357098fb882480d3e52e3a7df2a')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
