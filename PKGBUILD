# Maintainer: Samuel Ace Winchenbach <swinchen at gmail dot com>
_gemname=markdownlint
pkgname=ruby-${_gemname}
pkgver=0.5.0
pkgrel=1
pkgdesc='Style checker/lint tool for markdown files'
arch=(any)
url='https://github.com/markdownlint/markdownlint'
license=(Ruby)
depends=(ruby)
options=(!emptydirs)
source=(https://rubygems.org/downloads/mdl-${pkgver}.gem)
noextract=(mdl-${pkgver}.gem)
makedepends=(ruby-rdoc)
depends=(ruby-kramdown ruby-mixlib-config ruby-mixlib-cli)
sha1sums=('a91595da3f7f6f0888f62d8726351f9d0c828726')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" mdl-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/mdl-$pkgver.gem"
}

