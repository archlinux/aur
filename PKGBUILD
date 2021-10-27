# Maintainer: NINNiT <soelder@hotmail.com>

_gemname=ignore-it
pkgname=$_gemname
pkgver=1.1.0
pkgrel=1
pkgdesc='ignore-it - your command line tool for creating .gitignore files'
arch=(any)
url='https://github.com/lolcatbois/ignore-it'
license=(MIT)
depends=(ruby ruby-colorize ruby-thor)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('e4acae96ed20e568f82ac7cc98973550d16f6952e1eb113909c74be325b47a96')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
