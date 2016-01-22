# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
# Based on the ruby-kramdown PKGBUILD

pkgname=ruby-kramdown-rfc2629
pkgver=1.0.28
pkgrel=1
pkgdesc="An RFC2629 (XML2RFC) generating backend for Thomas Leitner's kramdown markdown parser"
arch=(any)
url='http://github.com/cabo/kramdown-rfc2629'
license=('MIT')
depends=('ruby' 'ruby-kramdown>=1.6')
options=(!emptydirs)
source=("https://rubygems.org/downloads/kramdown-rfc2629-${pkgver}.gem")
noextract=("kramdown-rfc2629-${pkgver}.gem")
sha256sums=('0ba334581e7bc568d37fe892fc87117682767ae2129ff6cbf0965e8f5e6df842')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install \
    -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "kramdown-rfc2629-${pkgver}.gem"

  install -D -m644 "${pkgdir}/${_gemdir}/gems/kramdown-rfc2629-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
