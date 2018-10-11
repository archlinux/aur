# Maintainer: buckket <buckket@cock.li>
# Contributors: masutu

pkgname=ebumeter
pkgver=0.4.2
pkgrel=2
pkgdesc="Loudness measurement according to EBU-R128."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio"
license=('GPL')
depends=(clthreads clxclient jack zita-resampler)
source=(${url}/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3f933357760172bf2febb32dc2f88362')

build() {
  cd "$srcdir/$pkgname-$pkgver"/source
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"/source
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/ebumeter
  install -m 755 ebur128 ${pkgdir}/usr/bin
  install -m 755 ebumeter ${pkgdir}/usr/bin
  install -m 644 ../share/* ${pkgdir}/usr/share/ebumeter
}

