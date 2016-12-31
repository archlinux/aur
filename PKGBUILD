# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-image_size
gemname=image_size
pkgver=1.5.0
pkgrel=1
pkgdesc='measure image size using pure Ruby.'
arch=('any')
url='https://github.com/toy/image_size'
license=('RUBY')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('a26c3eb5f77b2adf8aee1e9402cbd9dcb052d36fea344f884415d2ed9e76f481d7fb946d16a426c524d1b5c961537e29138d3ea355d66ff1ab4d4dbefc8aafea')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
