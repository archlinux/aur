# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='2.3.2'
pkgrel='1'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='http://singularity.lbl.gov'
license=('BSD')
depends=('bash' 'python')
source=("https://github.com/singularityware/singularity/releases/download/${pkgver}/singularity-${pkgver}.tar.gz")
md5sums=('f9fb71966f03c31f0f2b23aacc9146b4')

build() {
  cd "${srcdir}/singularity-${pkgver}"
  ./configure --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/singularity-${pkgver}"
  make DESTDIR="$pkgdir" install
}
