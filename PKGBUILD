# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='2.4.6'
pkgrel='1'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='http://singularity.lbl.gov'
license=('BSD')
depends=('bash' 'python' 'squashfs-tools')
source=("https://github.com/singularityware/singularity/releases/download/${pkgver}/singularity-${pkgver}.tar.gz")
md5sums=('30446f20ac880e2dfc7a856aee8cb52e')

build() {
  cd "${srcdir}/singularity-${pkgver}"
  ./configure --prefix='/usr' --disable-dependency-tracking --with-userns
  make
}

package() {
  cd "${srcdir}/singularity-${pkgver}"
  make DESTDIR="$pkgdir" install
}

