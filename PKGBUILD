# Maintainer: Luis Pérez <luis.perez@protonmail.com>
_gemname=spider
pkgname=ruby-$_gemname
pkgver=0.5.4
pkgrel=4
pkgdesc='A Web spidering library'
arch=(any)
url='https://github.com/johnnagro/spider'
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem"
	"https://raw.githubusercontent.com/johnnagro/spider/master/LICENSE"
       )
sha256sums=('9d95235b1e50ae03ec54b75b17956ddffae59c5eb7f1be8c79d8d16de13f3d3a'
	    'SKIP'
	   )
noextract=(
	   "$_gemname-$pkgver.gem"
	   "LICENSE"
	  )

package() {
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
