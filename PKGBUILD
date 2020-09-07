# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=samovar
pkgname=ruby-$_gemname
pkgver=2.1.4
pkgrel=1
pkgdesc='Samovar is a flexible option parser excellent support for sub-commands and help documentation.'
arch=(any)
url='https://github.com/ioquatix/samovar'
license=(MIT)
depends=(
  'ruby-console>=1.0'
  'ruby-mapping>=1.0'
)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('5d12e10a8afea505f903f6641d53a16b184dc997d563f24e4a87978f37348172')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
