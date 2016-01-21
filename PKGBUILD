# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=drafter
pkgver=2.1.2
pkgrel=1
pkgdesc='Snowcrash parser harness'
arch=('x86_64' 'i686')
url='https://github.com/apiaryio/drafter'
license=('custom')
depends=('gcc-libs')
makedepends=('python2')
source=("https://github.com/apiaryio/drafter/releases/download/v$pkgver/drafter-v$pkgver.tar.gz")
sha1sums=('56ad5432c7edd919956b463edde1afb953a93ef8')

build() {
  cd "${srcdir}/drafter-v${pkgver}"
  make PYTHON=python2
}

package() {
  cd "${srcdir}/drafter-v${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  make PYTHON=python2 DESTDIR="${pkgdir}/usr/bin" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
