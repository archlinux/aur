# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=octokit
pkgname=ruby-$_gemname
pkgver=4.2.0
pkgrel=1
pkgdesc="Simple wrapper for the GitHub API."
arch=(any)
url="https://github.com/octokit/octokit.rb"
license=('MIT')
depends=('ruby' 'ruby-sawyer')
makedepends=('rubygems')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('52056b01c81c98b18b11f3259f3624e54c0812e87a73247112e9ccec21b80b84')

package() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"
}

# vim:set ts=2 sw=2 et:
