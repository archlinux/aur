# Maintainer: <trash@ps3zone.org>
# Contributer: Rikles <style.boubou@gmail.com>
# Contributer: N30N <archlinux@alunamation.com>

pkgname="lightzone"
pkgver=4.1.8
pkgrel=1
pkgdesc="A professional photo browser and editor, like Aperture or Lightroom"
url="http://lightzoneproject.org/"
license=("custom")
arch=("i686" "x86_64")
depends=("javahelp2" "lcms2" "libjpeg-turbo" "libxml2")

if [[ $CARCH == 'i686' ]]; then
  source=("${pkgname}-${pkgver}.deb::http://download.opensuse.org/repositories/home:/ktgw0316:/LightZone/Debian_7.0/i386/${pkgname}_${pkgver}-0obs1_i386.deb")
  md5sums=('a3ed17c004e78b3cf48b28b9ab838422')
elif [[ $CARCH == 'x86_64' ]]; then
  source=("${pkgname}-${pkgver}.deb::http://download.opensuse.org/repositories/home:/ktgw0316:/LightZone/Debian_7.0/amd64/${pkgname}_${pkgver}-0obs1_amd64.deb")
  md5sums=('f49e838818f09637b438c27b3e61a371')
fi

build() {
  cd "${srcdir}"
  tar -xf data.tar.gz
}

package() {
  cd "${srcdir}"

# Install
  cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
}
