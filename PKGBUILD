# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>
pkgname=accuraterip-checksum
pkgver=1.4
pkgrel=1
pkgdesc="A C99 commandline program to compute the AccurateRip checksum of singletrack WAV files."
arch=('i686' 'x86_64')
url="https://github.com/leo-bogert/accuraterip-checksum"
license=('GPL')
depends=('libsndfile')
source=("https://github.com/leo-bogert/${pkgname}/archive/version${pkgver}.tar.gz")
md5sums=('a5a1ac13ed4f16266f972918e21bd095')

build() {
  cd ${srcdir}/${pkgname}-version${pkgver}
  cc -lsndfile ${pkgname}.c -o ${pkgname}
}

package() {
  cd ${srcdir}/${pkgname}-version${pkgver}
  install -D -m755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
