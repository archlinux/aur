# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-exifr
gemname=exifr
pkgver=1.3.4
pkgrel=1
pkgdesc='EXIF Reader is a module to read EXIF from JPEG and TIFF images.'
arch=('any')
url='https://github.com/remvee/exifr'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('1609018119942bd845fc06a93783cb8035da1bdbf8cdaa8335f649f226ba6c6fc52c984528db5fbc3277faa80410fa3708845f26d2e5a48ef36999f22e1cc3be')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
