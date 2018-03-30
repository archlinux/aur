# Maintainer: Mario Hros <m-aur@k3a.me>

_gemname=proj4rb
pkgname=ruby-$_gemname
pkgver=1.0.0
pkgrel=2
pkgdesc="Ruby binding for the Proj.4 Carthographic Projection library"
arch=('any')
url='https://github.com/cfis/proj4rb'
license=('MIT')
depends=('proj')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
md5sums=('27c491bca948b72deb54e59abb87ba1e')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  find "$pkgdir" -type f -name gem_make.out -exec rm {} \;
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

