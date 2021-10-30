# Maintainer:  Achilleas Pipinellis <axilleas at archlinux.info>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
# Contributor: gem2arch 0.1
pkgname=ruby-net-ssh
pkgver=6.1.0
_gemname=${pkgname#ruby-}
pkgrel=1
pkgdesc="A pure-Ruby implementation of the SSH2 client protocol."
arch=(any)
url="https://rubygems.org/gems/${_gemname}"
license=("GPL")
depends=('ruby')
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
sha512sums=('cd09fccb584f268aa52fff8a9ab52cec96b3e8be7f90c75c53f9e37492aabd15256fd3012128684954f6dbe912d2cfcf9eaeaeba93fdeb480bf6da6c08ec90f1')
