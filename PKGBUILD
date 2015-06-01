# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
# Based on the ruby-kramdown PKGBUILD

pkgname=ruby-kramdown-rfc2629
pkgver=1.0.26
pkgrel=1
pkgdesc="An RFC2629 (XML2RFC) generating backend for Thomas Leitner's kramdown markdown parser"
arch=(any)
url='http://github.com/cabo/kramdown-rfc2629'
license=('MIT')
depends=('ruby' 'ruby-kramdown>=1.6')
options=(!emptydirs)
source=("https://rubygems.org/downloads/kramdown-rfc2629-${pkgver}.gem")
noextract=("kramdown-rfc2629-${pkgver}.gem")
sha256sums=('8095d01dcb789ca8c133da5586b83f9c237000e0cdc4a506070eedc6a141b945')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install \
    -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "kramdown-rfc2629-${pkgver}.gem"

  install -D -m644 "${pkgdir}/${_gemdir}/gems/kramdown-rfc2629-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
