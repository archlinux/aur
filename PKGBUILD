# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-in_threads
gemname=in_threads
pkgver=1.4.0
pkgrel=1
pkgdesc='Execute ruby code in parallel.'
arch=('any')
url='https://github.com/toy/in_threads'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('6f3228687c2bba42beecaa12d8f348a24cd7088c159665cf50679ed11e37fe38e064b29cf9b8e881bbf46fabb3881874d0e1f3a48f9248ccb3142af17437b754')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
