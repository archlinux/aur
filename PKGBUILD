# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=ruby-jekyll-paginate-v2
pkgver=2.0.0
pkgrel=1
pkgdesc="Pagination Generator for Jekyll 3 (enhanced replacement for the old built-in jekyll-paginate gem)"
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-paginate-v2"
noextract=("jekyll-paginate-v2-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-paginate-v2-${pkgver}.gem")
sha256sums=('2bb6178154bd1d060616fe17a6214654abbe9d8710199438ef4b195afd758b94')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-paginate-v2-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-paginate-v2-${pkgver}.gem"

    install -Dm644 "${pkgdir}/${_gemdir}/gems/jekyll-paginate-v2-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
