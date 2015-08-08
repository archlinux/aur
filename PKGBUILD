# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='doit'
pkgver='20141116'
pkgrel='1'
pkgdesc='yet another remote-execution daemon for Windows'
arch=('i686' 'x86_64')
url='http://www.chiark.greenend.org.uk/~sgtatham/doit/'
license=('MIT')
#depends=('perl')
source=('http://www.chiark.greenend.org.uk/~sgtatham/doit/doit.tar.gz')
sha256sums=('994e78fc732d385ef9cf39e960452161d366aa7b15f934d9f656eae825a34797')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}"
  ./configure
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}"
  make -s
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dpm644 'LICENCE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" # spelling
  install -Dpm644 'README' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  set +u
}
set +u
