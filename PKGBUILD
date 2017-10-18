# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-exifr
gemname=exifr
pkgver=1.3.2
pkgrel=1
pkgdesc='EXIF Reader is a module to read EXIF from JPEG and TIFF images.'
arch=('any')
url='https://github.com/remvee/exifr'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('1ae47f7abaf3ebfa785096b49dfca614157cf847154fc5accb737114a700c444cc8f3468b8d188db7edeb68a96d968fb0c2ed0936479e8b3ba99212fe32529c7')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
