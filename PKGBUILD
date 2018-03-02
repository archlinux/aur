# Maintainer: johnjq <dev [at] johnjq (dot) com>

_gemname=pbkdf2-ruby
pkgname=ruby-$_gemname
pkgver=0.2.0
pkgrel=1
pkgdesc="Password Based Key Derivation Function 2 (PBKDF2) for Ruby"
arch=("any")
url="https://github.com/emerose/pbkdf2-ruby"
license=("MIT")
depends=("ruby" "ruby-rdoc")
options=("!emptydirs")
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=($_gemname-$pkgver.gem)
sha512sums=("09500dcf8a1eb1ec6bcac0e9da67df29fec4bde295f41eab8eb9ed918d7083a85d3811a1548de61193cfced7dce4c55f8bf6d73fc68b45018769e5abde02a3a9")

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
