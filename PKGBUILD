# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-fspath
gemname=fspath
pkgver=3.0.1
pkgrel=1
pkgdesc='Better than Pathname.'
arch=('any')
url='https://github.com/toy/fspath'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('9e8d9ca5f704f9b057bb772084188eb453a7b11c1843423c36dedf305808a0cd77fa763b7fac37f68e6d2bb27b28034af00ea2a295089aa3ef483e8b7e0b939b')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
