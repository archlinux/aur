# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='gemgen'
pkgname="ruby-${_gemname_}"
pkgver='0.0.4'
pkgrel=1
pkgdesc='The Compass core stylesheet library'
arch=('any')
url='None'
license=('unknown')
depends=('ruby' 'ruby-bundler')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('e99f294c0a17fbca4c9d3d2ddd60eea3568d48e2733d83a0465adab1df4edaec')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
