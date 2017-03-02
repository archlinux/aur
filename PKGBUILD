
pkgname=r10k
pkgver=2.5.2
pkgrel=3
pkgdesc="R10K provides a general purpose toolset for deploying Puppet environments and modules."
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/r10k"
license=('Apache')
depends=('ruby' 'ruby-colored' 'ruby-cri' 'ruby-gettext-setup' 'ruby-log4r' 'ruby-minitar' 'ruby-multi_json' 'ruby-puppet_forge' 'ruby-semantic_puppet')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('cad9237a9fd29dd24d54bd12f4a2e255886f4a4c3beb9c972fd0947a4306852a')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
