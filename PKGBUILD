# Maintainer: 3D_Daxter
# Contributor: CarstenF

_gemname=nori
pkgname=ruby-$_gemname
pkgver=2.7.1
pkgrel=1
pkgdesc='XML to Hash translator'
arch=(any)
url='https://github.com/savonrb/nori'
license=(MIT)
depends=('ruby')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('6166cd336959854762073e2fbae888593809cac1b3e904f4fb009313d7226861')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
