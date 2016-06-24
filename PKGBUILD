# Maintainer: Christopher Loen <christopherloen at gmail dot com>
_gemname_='mixlib-cli'
pkgname='ruby-mixlib-cli'
pkgver='1.6.0'
pkgrel=1
pkgdesc='Provides a class-based command line option parsing object'
arch=('any')
url='https://github.com/chef/mixlib-cli'
license=('Apache2')
depends=('ruby')
source=('https://rubygems.org/downloads/mixlib-cli-1.6.0.gem')
sha256sums=('81381d1b4a577cfb9ee49609b23f532334432bc0f747f6c3ffa5ef12114d59d8')


package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_gemname_}-${pkgver}.gem"
  rm "${pkgdir}/${_gemdir}/cache/${_gemname_}-${pkgver}.gem"
  install -D -m644 "${pkgdir}/${_gemdir}/gems/${_gemname_}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
