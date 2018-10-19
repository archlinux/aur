# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-progress
gemname=progress
pkgver=3.5.0
pkgrel=1
pkgdesc='Show progress of long running tasks.'
arch=('any')
url='https://github.com/toy/progress'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('1a251a25b1f312512a3dd4651f8ab835ca0a0ce5a480839867f98646f5473f807e2b228f0c69524a814da3ea37e569ef02fab3b0f3d291a51ad8b26b359c0b5e')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
