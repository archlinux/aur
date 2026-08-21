# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=ruby-enum
pkgver=1.2.1
pkgrel=1
pkgdesc="Enum-like behavior for Ruby"
arch=(x86_64)
url="https://github.com/dblock/${pkgname}"
license=(MIT)
depends=(ruby)
optdepends=('ruby-i18n: for translation support')
source=(https://rubygems.org/downloads/${pkgname}-${pkgver}.gem)
noextract=(${pkgname}-${pkgver}.gem)
sha256sums=('c8e2e88479b0d23b5f117f0ed96739ccf8abfd9be1bb5902eecd3c0200a1f3aa')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${pkgname}-${pkgver}.gem
  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
  find "${pkgdir}" -type d -empty -delete
}
