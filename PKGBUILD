# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>
# Contributor: Toke Høiland-Jørgensen <toke@toke.dk>
# Based on the ruby-kramdown PKGBUILD

pkgname=ruby-kramdown-rfc2629
_name="${pkgname#ruby-}"
pkgver=1.7.3
pkgrel=1
pkgdesc="An RFC2629 (XML2RFC) generating backend for Thomas Leitner's kramdown markdown parser"
arch=(any)
url='http://github.com/cabo/kramdown-rfc2629'
license=('MIT')
depends=('ruby-certified>=1.0' 'ruby-differ>=0.1' 'ruby-json>=2.0' 'ruby-kramdown>=2.4' 'ruby-kramdown-parser-gfm>=1.1' 'ruby-net-http-persistent>=4.0' 'ruby-unicode-blocks>=1.0' 'ruby-unicode-name>=1.0' 'ruby-unicode-scripts>=1.0')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(305b2a7a320bb77a8b389ee5958ae4542102151af523cdc839a0a288524c064a)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"

    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
