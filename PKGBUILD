# Maintainer: Henry-Joseph Audéoud <henry-joseph.audeoud@univ-grenoble-alpes.fr>
# Based on the ruby-kramdown-rfc2629 PKGBUILD

_basename=certified
pkgname="ruby-${_basename}"
pkgver=1.0.0
pkgrel=1
pkgdesc="Ensure net/https verifies SSL certificates and provides certificate bundle"
arch=(any)
url="http://github.com/stevegraham/${_basename}"
license=('MIT')
depends=('ruby>=1.8.7')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_basename}-${pkgver}.gem")
noextract=("${_basename}-${pkgver}.gem")
sha256sums=('aa4cdf0e90e7ee96f6e0ce3daae39eaa8f0486124e0d92daf64d2105aeb9069c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install \
    -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_basename}-${pkgver}.gem"
}
