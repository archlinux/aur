# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=rsync
pkgname=ruby-$_gemname
pkgver=1.0.9
pkgrel=1
pkgdesc='Ruby/Rsync is a Ruby library that can syncronize files between remote hosts by wrapping a call to the rsync binary.'
arch=(any)
url='https://github.com/jbussdieker/ruby-rsync'
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('bbdb69727a7cf17a26be5dce197d15957dfaf8ed4814811da6b1ef17f0110b5d')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
