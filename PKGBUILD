# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=ruby-jekyll-seo-tag
pkgver=2.5.0
pkgrel=1
pkgdesc="A Jekyll plugin to add metadata tags for search engines and social networks to better index and display your site's content"
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-seo-tag"
noextract=("jekyll-seo-tag-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-seo-tag-${pkgver}.gem")
md5sums=('5dff5c7ed28018a38b6381fbc8f44422')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-seo-tag-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-seo-tag-${pkgver}.gem"

    install -Dm644 "${pkgdir}/${_gemdir}/gems/jekyll-seo-tag-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
