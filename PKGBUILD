# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: fila pruda.com

set -u
pkgname='dbview'
pkgver='1.0.4'
pkgrel='2'
pkgdesc='A small utility that will display dBase III and IV files and can convert your old .dbf files.'
arch=('i686' 'x86_64')
url='http://www.infodrom.org/projects/dbview/'
license=('GPL')
depends=('glibc')
source=("http://www.infodrom.org/projects/dbview/download/dbview-${pkgver}.tar.gz")
sha256sums=('bca41716e1ec0ce8833bcacfa17063f338b25f249f92ddb954c7d935e008cee7')

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  install -Dpm755 'dbview' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'dbview.1' -t "${pkgdir}/usr/share/man/man1/"
  set +u
}
set +u
