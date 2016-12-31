# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-progress
gemname=progress
pkgver=3.2.2
pkgrel=1
pkgdesc='Show progress of long running tasks.'
arch=('any')
url='https://github.com/toy/progress'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('37e221cb69ce454764b0dffde98567e700703ee894ca0ed2e3b216353fcbff07b73e817a50ae1c23661dfacdd7414d5313ac04492eff32b206e4e25a72c6ad55')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
