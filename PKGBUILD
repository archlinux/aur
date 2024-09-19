# Contributor: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>
# Contributor: Toke Høiland-Jørgensen <toke@toke.dk>
# Based on the ruby-kramdown PKGBUILD

pkgname=ruby-kramdown-rfc2629
_name="${pkgname#ruby-}"
pkgver=1.7.19
pkgrel=1
pkgdesc='An RFCXML (RFC 799x) generating backend for Thomas Leitner'"'"'s
"kramdown" markdown parser.  Mostly useful for RFC writers.'
arch=(any)
url='http://github.com/cabo/kramdown-rfc2629'
license=('MIT')
depends=('ruby' 'ruby-base64' 'ruby-certified' 'ruby-differ' 'ruby-json_pure' 'ruby-kramdown' 'ruby-kramdown-parser-gfm' 'ruby-net-http-persistent' 'ruby-unicode-blocks' 'ruby-unicode-name' 'ruby-unicode-scripts')
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(832ec677dc330a9b6da83d3c1a7446e97fb63cf8b0b9285054ec8a48644e9d2a)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"

    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
