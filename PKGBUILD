# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ruby-enum
pkgver=1.0.0
pkgrel=1
pkgdesc="Enum-like behavior for Ruby"
arch=(x86_64)
url="https://github.com/dblock/${pkgname}"
license=(MIT)
depends=(ruby)
optdepends=('ruby-i18n: for translation support')
source=(https://rubygems.org/downloads/${pkgname}-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
sha256sums=('e767ef5ae8debc1d2d4a6aefee9db64f0eefbf0633f5e18b5c5816459282c6e7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
