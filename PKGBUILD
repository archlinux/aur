# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='2.1.2'
pkgrel='1'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='http://singularity.lbl.gov'
license=('BSD')
depends=('bash')
source=("https://github.com/gmkurtzer/singularity/archive/${pkgver}.tar.gz")
md5sums=('d581dc080e6d5e2e055e4cc91572c829')

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
