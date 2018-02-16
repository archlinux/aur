# Maintainer: Andrew Rabert <draje@nullsum.net>

pkgname=ruby-exifr
gemname=exifr
pkgver=1.3.3
pkgrel=2
pkgdesc='EXIF Reader is a module to read EXIF from JPEG and TIFF images.'
arch=('any')
url='https://github.com/remvee/exifr'
license=('MIT')
depends=('ruby')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/${gemname}-${pkgver}.gem")
noextract=("${gemname}-${pkgver}.gem")
sha512sums=('7362913874d4d78f8c5b7da7a5bc99a6f7bb120e58ebb67dc196e60bc7ac14243a2989a7e4e7db1853c71d09d866275d909c6407d72ec0271c34c1bb7f15ebc9')

package() {
    local _gemdir="$(ruby -e'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" ${gemname}-${pkgver}.gem
    rm "${pkgdir}/${_gemdir}/cache/${gemname}-${pkgver}.gem"
}
