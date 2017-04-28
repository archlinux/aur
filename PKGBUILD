# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=puppet-lint
pkgver=2.2.1
pkgrel=1
pkgdesc="Check that your Puppet manifests conform to the style guide."
arch=('i686' 'x86_64')
url="https://github.com/rodjek/puppet-lint"
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('f7f191e8bcd8ff35744bd5197548d283ecc1e117e08b6a3f0e614cb306140d87')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
