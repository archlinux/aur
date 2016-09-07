# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=librarian-puppet
pkgver=2.2.3
pkgrel=1
pkgdesc='Bundler for your Puppet modules.'
arch=(any)
url='http://librarian-puppet.com'
license=('MIT')
depends=(ruby ruby-librarianp ruby-rsync ruby-puppet_forge)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('4c27ad7ca885dae53f0bbb0124a5871a210030f5086a1e78c9e5e0d17299d0bd')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
}
