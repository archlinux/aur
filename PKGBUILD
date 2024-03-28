# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Ankit R Gadiya <arch@argp.in>

pkgname=ruby-jekyll-seo-tag
pkgver=2.8.0
pkgrel=1
pkgdesc="Jekyll plugin to add metadata tags for search engines and social networks to better index and display your site"
arch=('any')
depends=('jekyll')
url="https://rubygems.org/gems/jekyll-seo-tag"
noextract=("jekyll-seo-tag-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-seo-tag-${pkgver}.gem")
sha256sums=('3f2ed1916d56f14ebfa38e24acde9b7c946df70cb183af2cb5f0598f21ae6818')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-seo-tag-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-seo-tag-${pkgver}.gem"

    install -Dm644 "${pkgdir}/${_gemdir}/gems/jekyll-seo-tag-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
