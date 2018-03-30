# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='2.4.5'
pkgrel='1'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='http://singularity.lbl.gov'
license=('BSD')
depends=('bash' 'python' 'squashfs-tools')
source=("https://github.com/singularityware/singularity/releases/download/${pkgver}/singularity-${pkgver}.tar.gz")
md5sums=('1d46a29c902d98e176b778c03af133f0')

build() {
  cd "${srcdir}/singularity-${pkgver}"
  ./configure --prefix='/usr' --disable-dependency-tracking --with-userns
  make
}

package() {
  cd "${srcdir}/singularity-${pkgver}"
  make DESTDIR="$pkgdir" install
}

