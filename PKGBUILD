# Maintainer:  Achilleas Pipinellis <axilleas at archlinux.info>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
# Contributor: gem2arch 0.1
pkgname=ruby-net-ssh
pkgver=2.9.2
_pkgname="net-ssh"
pkgrel=1
pkgdesc="Net::SSH: a pure-Ruby implementation of the SSH2 client protocol."
arch=(any)
url="https://rubygems.org/gems/net-ssh"
license=("GPL")
depends=('ruby')
source=(https://rubygems.org/downloads/$_pkgname-$pkgver.gem)

noextract=($_pkgname-$pkgver.gem)

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_pkgname}-$pkgver.gem
}
md5sums=('ac7574a89e2b422468d98f5387ceb41e')
