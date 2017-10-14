# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='2.4'
pkgrel='2'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='http://singularity.lbl.gov'
license=('BSD')
depends=('bash' 'python' 'squashfs-tools')
source=("https://github.com/singularityware/singularity/releases/download/${pkgver}/singularity-${pkgver}.tar.gz")
md5sums=('b05f2053b58fe15db06cfc5f3fa32fbd')

build() {
  cd "${srcdir}/singularity-${pkgver}"
  ./configure --prefix='/usr' --disable-dependency-tracking
  make
}

package() {
  cd "${srcdir}/singularity-${pkgver}"
  make DESTDIR="$pkgdir" install
}
