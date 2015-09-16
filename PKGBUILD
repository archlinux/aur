# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: alister.hood <gmail>

set -u
pkgname='judge'
pkgver='0.0.2'
pkgrel='1'
pkgdesc='Evaluate the quality of jpeg images (e.g. to guess which was saved with higher quality).'
arch=('i686' 'x86_64')
url='http://oldhome.schmorp.de/marc/judge.html'
license=('GPL')
depends=('libjpeg')
source=("http://oldhome.schmorp.de/marc/data/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e43d15db51a5bf6f1460df0cdf6e0ea183942a17a83b0e0313102129ba0d4725')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  ./configure --prefix='/usr' --mandir='/usr/share/man'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
