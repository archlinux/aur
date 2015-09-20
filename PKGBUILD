# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=lolcommits
pkgver=0.6.0
pkgrel=1
pkgdesc="Takes a snapshot with your webcam every time you git commit code."
arch=('any')
url="https://mroth.github.io/lolcommits/"
license=('GPL')
depends=('ruby' 'mplayer' 'imagemagick'
	'ruby-choice' 'ruby-git' 'ruby-httmultiparty'
	'ruby-httparty' 'ruby-json' 'ruby-launchy' 'ruby-methadone' 'ruby-mime-types-1'
	'ruby-oauth' 'ruby-open4' 'ruby-rest-client' 'ruby-twitter' 'ruby-yam')
makedepends=('rubygems')
source=(https://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('067407532775e4031e1b252b8da8e9033bf9788b11f3da5e52bbe3c04afd3942')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
