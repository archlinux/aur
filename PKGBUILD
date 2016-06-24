# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='hashie'
pkgname="ruby-${_gemname_}-2"
pkgver='3.4.4'
pkgrel=1
pkgdesc="Hashie is a collection of classes and mixins that make hashes more powerful."
arch=('any')
url='https://github.com/intridea/hashie'
license=('MIT')
depends=('ruby')
options=(!emptydirs)
source=('https://rubygems.org/downloads/hashie-3.4.4.gem')
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('9dd69627730107041421f453eebef585251a50f6ec2720de0bce2443736598e2')

package() {

  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
