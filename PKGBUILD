# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-in_threads
gemname=in_threads
pkgver=1.3.1
pkgrel=1
pkgdesc='Execute ruby code in parallel.'
arch=('any')
url='https://github.com/toy/in_threads'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('15bbe29882c3a3b36b3f76db87836e88654cb5e6c34ebc95e5cfe7073eeeb4b8a7bd4cb5f8d673e903c12c05312e787cb518718865d2750df456cb5a2fd59f3f')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
