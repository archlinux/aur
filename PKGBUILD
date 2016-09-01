# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=sshkit
pkgname=ruby-$_gemname
pkgver=1.11.2
pkgrel=1
pkgdesc='A toolkit for deploying code and assets to servers in a repeatable, testable, reliable way.'
arch=(any)
url='https://github.com/capistrano/sshkit'
license=('MIT')
depends=(ruby ruby-net-scp ruby-net-ssh)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('610cebe87c1c016693e2d80bb5e5411961a0405358bdba6a6b3f11d682bfc125')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
