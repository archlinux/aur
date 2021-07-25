# Contributor: Andy Weidenbaum <archbaum@gmail.com>
_gemname=gemoji
pkgname=ruby-gemoji
pkgver=4.0.0.rc2
pkgrel=1
pkgdesc="Image assets and character information for emoji"
arch=('any')
url="https://github.com/github/gemoji"
license=('custom:MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('0cfb4101e11b8d091a9e26c2899789102b4151da467e5a6257d5058abb4663f7')
noextract=("${pkgname#*-}-${pkgver}.gem")

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-document --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}