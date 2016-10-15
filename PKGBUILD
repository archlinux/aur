# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='2.2'
pkgrel='1'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='http://singularity.lbl.gov'
license=('BSD')
depends=('bash' 'python')
source=("https://github.com/gmkurtzer/singularity/archive/${pkgver}.tar.gz")
md5sums=('0af0c52fc2d732b457e89e29a7fc3ea0')

build() {
  cd "${srcdir}/singularity-${pkgver}"
  ./autogen.sh
  ./configure --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/singularity-${pkgver}"
  make DESTDIR="$pkgdir" install
}
