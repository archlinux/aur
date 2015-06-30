# Maintainer: Christian Hesse <mail@eworm.de>

_gemname=cheat
pkgname=ruby-$_gemname
pkgver=1.3.0
pkgrel=1
pkgdesc='Cheat Sheets'
arch=('any')
url='http://cheat.errtheblog.com/'
license=('GPL')
depends=(ruby)
makedepends=(rubygems)
source=("http://gems.rubyforge.org/gems/${_gemname}-${pkgver}.gem")
noextract=("${_gemname}-${pkgver}.gem")
sha256sums=('d9556a5988ac29ecb601f25880925e8f6d5b13dff36323821050e276936c2209')

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"
}

