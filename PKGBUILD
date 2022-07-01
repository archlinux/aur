# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>

_gemname=octokit
pkgname=ruby-$_gemname
pkgver=4.25.1
pkgrel=1
pkgdesc="Simple wrapper for the GitHub API."
arch=(any)
url="https://github.com/octokit/octokit.rb"
license=('MIT')
depends=('ruby-faraday' 'ruby-sawyer')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c02092ee82dcdfe84db0e0ea630a70d32becc54245a4f0bacfd21c010df09b96')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
