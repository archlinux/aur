# Maintainer: Hao Long <aur@esd.cc>

_gemname=progress_bar
pkgname=ruby-$_gemname
pkgver=1.3.4
pkgrel=1
pkgdesc='Simple Progress Bar for output to a terminal'
arch=(any)
url='http://github.com/paul/progress_bar'
license=(WTFPL)
depends=(ruby-highline ruby-options)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
b2sums=('d05a17cdd04d993e6b78f8d91e7572292b59eb80e3eb9e7784c515a9ca6d1ce1b72e75d7cbb9b8315323534f3409ebf13302f8c097ab1eb65ab07b72455a64e4')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
