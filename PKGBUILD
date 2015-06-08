# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Emiliano Vavassori <syntaxerrormmm(at)gmail.com>
pkgname=ruby-hoe
_gemname=hoe
pkgver=3.13.1
pkgrel=1
pkgdesc="Hoe is a rake/rubygems helper for project Rakefiles"
arch=(any)
url="http://www.zenspider.com/projects/hoe.html"
license=("MIT")
depends=('ruby' 'rake>=0.8' 'rake<=11.0')
makedepends=('rubygems')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
md5sums=('739d4ede50ba5bf9fabb03cef59c3737')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" "${_gemname}-${pkgver}.gem"
}
