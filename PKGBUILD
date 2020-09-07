# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_gemname=mapping
pkgname=ruby-$_gemname
pkgver=1.1.1
pkgrel=1
pkgdesc='Map model objects based on their class to a given output model.'
arch=(any)
url='https://github.com/ioquatix/mapping'
license=(MIT)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('c677c3a343960feafbfac8434300d1ad88817b7d6e969aead45ba8807f2af2b9')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
