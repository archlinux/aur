# Contributor: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ruby-unicode-blocks
_name="${pkgname#ruby-}"
pkgver=1.10.0
pkgrel=1
pkgdesc='[Unicode 15.1.0] Answers the question: Which Unicode block does a code point belong to?'
arch=(any)
url="https://github.com/janlelis/${_name}"
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(be31b8e19479a2bfb04803cccac02781ee12d2e99d0ee6f1dbbc976c3d2139cd)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/MIT-LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
