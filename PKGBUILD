
pkgname=r10k
pkgver=3.3.3
pkgrel=1
pkgdesc="R10K provides a general purpose toolset for deploying Puppet environments and modules."
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/r10k"
license=('Apache')
depends=('ruby' 'ruby-colored' 'ruby-cri' 'ruby-gettext-setup' 'ruby-log4r' 'ruby-minitar' 'ruby-multi_json' 'ruby-semantic_puppet')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('4306e4e230aa3e18e6248b9d11fe776f84d1c5dd727fba74cd804c9213899f94')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
