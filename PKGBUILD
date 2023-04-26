# Maintainer: Philipp Seiler <p.seiler@linuxmail.org>

pkgname=ruby-jekyll-regex-replace
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple module to allow using regular expression replacing via liquid filters"
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-regex-replace"
noextract=("jekyll-paginate-v2-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-regex-replace-${pkgver}.gem")
sha256sums=('3738e6a0aa07dd3f9b7369e6e38e5d245c623bbd70c31b21e7838c654377a00c')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-regex-replace-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-regex-replace-${pkgver}.gem"

    install -Dm644 "${pkgdir}/${_gemdir}/gems/jekyll-regex-replace-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
