# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=ruby-kramdown
pkgver=1.8.0
pkgrel=1
pkgdesc='A fast, pure-Ruby Markdown-superset converter'
arch=(any)
url='http://kramdown.gettalong.org'
license=('MIT')
depends=('ruby')
source=("https://rubygems.org/downloads/kramdown-${pkgver}.gem")
noextract=("kramdown-${pkgver}.gem")
md5sum=('8bdb6aed0244d0fe77b2f5b49c44da0c8d597e7909b9f59052f7846bd1b85170')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install \
    -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "kramdown-${pkgver}.gem"

  install -D -m644 "${pkgdir}/${_gemdir}/gems/kramdown-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
md5sums=('ad7f75fe981513f7ae18e93504d13406')
