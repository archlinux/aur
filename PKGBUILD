# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-fspath
gemname=fspath
pkgver=3.1.0
pkgrel=1
pkgdesc='Better than Pathname.'
arch=('any')
url='https://github.com/toy/fspath'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('c6d78a53489077634c56f84d09de476227172cca7ef8ff21a72e48d992189fc3af25798c193b1866a56abc583fb54c4fc426ea96ac6d6ec5944a92cd425705b7')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
