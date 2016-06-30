# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='jbuilder'
pkgname="ruby-${_gemname_}"
pkgver='2.5.0'
pkgrel=1
pkgdesc='Create JSON structures via a Builder-style DSL'
arch=('any')
url='https://github.com/rails/jbuilder'
license=('MIT')
depends=('ruby' 'ruby-multi_json' 'ruby-activesupport')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
sha256sums=('135e5406a2bb7a1256dab97a3beee5ea79d9a7c939e76ddfe43f4000a7a3af74')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
