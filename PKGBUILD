# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Olivier Médoc "oliv" <o_medoc@yahoo.fr>
_gemname=colored
pkgname=ruby-${_gemname}
pkgver=1.2
pkgrel=3
pkgdesc='Ruby library for colorizing text output in your terminal'
arch=(any)
url="http://github.com/defunkt/colored"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
noextract=(${_gemname}-${pkgver}.gem)
sha256sums=('9d82b47ac589ce7f6cab64b1f194a2009e9fd00c326a5357321f44afab2c1d2c')

package() {
    cd "${srcdir}"
    local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" ${_gemname}-${pkgver}.gem
}

