# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname_='opener'
pkgname="ruby-${_gemname_}"
pkgver='0.1.0'
pkgrel=1
pkgdesc='A 33-line alternative to the popular launchy library.'
arch=('any')
url='https://github.com/sunaku/opener'
license=('Ruby')
depends=('ruby')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('7fe5ccc88aa97c24386b562d132ee267280fb3ad14e471d9105b3a56a18cfd59')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}

