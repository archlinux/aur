# Maintainer: Valdis Vitolins <valdis.vitolins@odo.lv>
pkgname=flite-hts-engine
pkgver=1.07
pkgrel=1
pkgdesc="Flite + HTS engine to synthesize speech waveform from HMMs trained by hts."
arch=('i686' 'x86_64' 'armv7h')
url="https://sourceforge.net/projects/hts-engine/files/"
license=('BSD')
depends=('glibc')
depends=('hts-engine')
options=('staticlibs')
source=("http://downloads.sourceforge.net/hts-engine/flite%2Bhts_engine-${pkgver}.tar.gz")
md5sums=('541a07777c7b1ea518e1f6f4c745ecc0')
sha256sums=('5a17c16683a8353077560e0e9b779c331ccc1a5f8da51740612043e65fc9e805')

build()
{
  cd "$srcdir/flite+hts_engine-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$srcdir/flite+hts_engine-$pkgver"
  make prefix="$pkgdir/usr" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
