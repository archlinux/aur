# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-exifr
gemname=exifr
pkgver=1.2.5
pkgrel=1
pkgdesc='EXIF Reader is a module to read EXIF from JPEG and TIFF images.'
arch=('any')
url='https://github.com/remvee/exifr'
license=('MIT')
depends=('ruby')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('92ed7a06cad2df015248f739c2cad0188eeca02b517a7769275025c30c2379a5471a2884e70233fabd8b938310eeef285d42f62dda4ea05595c01b1adb0989a3')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
