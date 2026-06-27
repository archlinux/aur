# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ruby-enum
pkgver=1.1.0
pkgrel=1
pkgdesc="Enum-like behavior for Ruby"
arch=(x86_64)
url="https://github.com/dblock/${pkgname}"
license=(MIT)
depends=(ruby)
optdepends=('ruby-i18n: for translation support')
source=(https://rubygems.org/downloads/${pkgname}-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
sha256sums=('bd855e4c5617eb12bc6c8711e412ae5b8982ae4f1c10562b456e6a05804649b7')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
