# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-exifr
gemname=exifr
pkgver=1.3.1
pkgrel=1
pkgdesc='EXIF Reader is a module to read EXIF from JPEG and TIFF images.'
arch=('any')
url='https://github.com/remvee/exifr'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('e2e2158bbd331525a1a784ef816ac1fc45a97c75252fb5a5e624421519184d58f74426de3f274cd827af48ff2f3dc6081e3e26a5765ef6eaf1c4545a40a58a7e')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
