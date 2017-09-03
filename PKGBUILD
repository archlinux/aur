# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-progress
gemname=progress
pkgver=3.3.1
pkgrel=1
pkgdesc='Show progress of long running tasks.'
arch=('any')
url='https://github.com/toy/progress'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('0e88f6262e32a6a0286bc80cd12ce88f40052aeb64e70515e1a7311d0e197dd101a9f3c941ee0a7b08f3a14f4e9740ccba43c828e515e5935bc76d1c7c627dfc')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
