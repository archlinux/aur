# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=ruby-cfpropertylist
_gemname=CFPropertyList
pkgver=2.3.6
pkgrel=2
pkgdesc="A module to read, write and manipulate property lists as defined by Apple."
arch=('any')
url="http://github.com/ckruse/CFPropertyList/"
license=('MIT')
depends=('ruby')
source=(http://rubygems.org/downloads/${_gemname}-${pkgver}.gem)
sha512sums=('f30b26ea6652f4c65faa4f173e2fa16b7084282cf103328f284f096dc4495af4c298d447f7e90f566a55d47ed813c7eaa967733b5b6ccc336a782e0271060357')
noextract=(${_gemname}-${pkgver}.gem)

package() {
  cd "${srcdir}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}${_gemdir}" -n "${pkgdir}/usr/bin" ${_gemname}-${pkgver}.gem

}
