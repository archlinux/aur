# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

pkgname=ruby-hoe
_gemname=hoe
pkgver=3.16.0
pkgrel=1
pkgdesc="Hoe is a rake/rubygems helper for project Rakefiles"
arch=(any)
url="http://www.zenspider.com/projects/hoe.html"
license=("MIT")
depends=('ruby')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('4de91b1389248423f32d42cb27e97379')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" "${_gemname}-${pkgver}.gem"
}
