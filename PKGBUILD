# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=ruby-jekyll-feed
pkgver=0.16.0
pkgrel=1
pkgdesc="A Jekyll plugin to generate an Atom (RSS-like) feed of your Jekyll posts"
arch=('any')
depends=('ruby' 'jekyll')
url="https://rubygems.org/gems/jekyll-feed"
noextract=("jekyll-feed-${pkgver}.gem")
license=('MIT')
source=("https://rubygems.org/downloads/jekyll-feed-${pkgver}.gem")
sha256sums=('54aec4eef9e697f142bee19a83cccfee96a3af003d1b25242ac4b615a27b972c')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "jekyll-feed-${pkgver}.gem"
    rm "${pkgdir}/${_gemdir}/cache/jekyll-feed-${pkgver}.gem"

    install -Dm644 "${pkgdir}/${_gemdir}/gems/jekyll-feed-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
