# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-image_size
gemname=image_size
pkgver=2.0.0
pkgrel=1
pkgdesc='measure image size using pure Ruby.'
arch=('any')
url='https://github.com/toy/image_size'
license=('RUBY')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('971db969d2224181c256a2b6b8efbd1f3593c1a4a3ca572f04a60f6c0e355192ef825c09cb3b5dba0b15830cab1dcf1b4256ea9f574d4df032a605dc03910e41')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
