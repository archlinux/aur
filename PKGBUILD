# Maintainer: Christopher Loen <christopherloen at gmail dot com>

_gemname_='win32-process'
pkgname="ruby-${_gemname_}"
pkgver='0.8.3'
pkgrel=1
pkgdesc='Adds several Process methods that are either unimplemented or dysfunctional in some way in the default Ruby implementation'
arch=('any')
url='https://github.com/djberg96/win32-process'
license=('Artistic-2.0')
depends=('ruby' 'ruby-ffi')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_gemname_}-${pkgver}.gem")
noextract=("${_gemname_}-${pkgver}.gem")
sha256sums=('6cee45057fb84b29cf80fc36de2d4ec6e800f6df5da7f3c899bd7faf9553989d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
}
