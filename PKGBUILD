
pkgname=r10k
pkgver=3.1.0
pkgrel=1
pkgdesc="R10K provides a general purpose toolset for deploying Puppet environments and modules."
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/r10k"
license=('Apache')
depends=('ruby' 'ruby-colored' 'ruby-cri' 'ruby-gettext-setup' 'ruby-log4r' 'ruby-minitar' 'ruby-multi_json' 'ruby-semantic_puppet')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('d08d24ec49e28220f4b571f1ae71ed7d66d2887ea3dcc6936357ea648f6924fd')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
