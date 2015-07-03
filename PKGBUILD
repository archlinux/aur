# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=lolcommits
pkgver=0.5.7
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
sha256sums=('d0713f307b1a244b6792bae765f0880b36eafc10383be26a13f21ee82c314f2d')

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "$pkgname-$pkgver.gem"
}
