# Contributor: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ruby-unicode-types
_name="${pkgname#ruby-}"
pkgver=1.10.0
pkgrel=1
pkgdesc='[Unicode 15.1.0] Determines the very basic type of codepoints (one of: Graphic, Format, Control, Private-use, Surrogate, Noncharacter, Reserved)'
arch=(any)
url="https://github.com/janlelis/${_name}"
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(918b76a0b57c54244df571887e53903027fc493cfbcec87432eb3acac7362ed6)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/MIT-LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
