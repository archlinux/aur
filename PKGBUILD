# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-progress
gemname=progress
pkgver=3.4.0
pkgrel=1
pkgdesc='Show progress of long running tasks.'
arch=('any')
url='https://github.com/toy/progress'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('d062623e6cedb96356fc34079b973dfef839e7a3cf37d7f92fabc4280a3f01d3ae2d446b54e4e79a95f44db16377e9b041f977137f4fc9606f222f589aa79da2')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
