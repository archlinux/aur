# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: farwayer <farwayer@gmail.com>

_gemname=google-cloud-env
pkgname=ruby-${_gemname}
pkgver=1.6.0
pkgrel=1
pkgdesc="Provides information on the Google Cloud Platform hosting environment"
arch=('any')
url="https://rubygems.org/gems/${_gemname}"
license=('Apache')
depends=(
  'ruby'
  'ruby-faraday>=0.17.3' 'ruby-faraday<3'
)
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname}-${pkgver}.gem")
noextract=("$_gemname-$pkgver.gem")
sha256sums=('6179acb946975892c7908748df5722a4ebadfc8cf5bb7b0d8d933ca67183fa15')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" "$_gemname-$pkgver.gem"
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
