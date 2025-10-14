# Contributor: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ruby-unicode-types
_name="${pkgname#ruby-}"
pkgver=1.11.0
pkgrel=1
pkgdesc='Basic Unicode Types of a Ruby String'
arch=(any)
url="https://github.com/janlelis/${_name}"
license=('MIT')
depends=(ruby)
options=(!emptydirs)
source=("https://rubygems.org/downloads/${_name}-${pkgver}.gem")
noextract=("${_name}-${pkgver}.gem")
sha256sums=(81d1201273260fa89b85471e7eebb93a51bb4e5f078a525508dcae7835d176f9)

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install \
        -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${_name}-${pkgver}.gem"

    install -D -m644 "${pkgdir}/${_gemdir}/gems/${_name}-${pkgver}/MIT-LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
