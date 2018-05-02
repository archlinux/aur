# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-in_threads
gemname=in_threads
pkgver=1.5.0
pkgrel=2
pkgdesc='Execute ruby code in parallel.'
arch=('any')
url='https://github.com/toy/in_threads'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('9565c295d89ee3d40cf71d9cd9296b3e4cd4df90b92e063607a6cb6c2073668445e46be6e91c61d88543fe8b088e7410cd3e2fb86fa941af0ca30ce7ad4326ab')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
