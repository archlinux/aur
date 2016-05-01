# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Stephane A. Sezer <sas@cd80.net>

set -u
pkgname='vmfs-tools'
pkgver='0.2.5'
pkgrel='1'
pkgdesc='A FUSE module for mounting VMFS filesystems'
arch=('i686' 'x86_64')
url='http://glandium.org/projects/vmfs-tools'
license=('GPL2')
depends=('fuse')
makedepends=('asciidoc')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d706138fdd5a71895f30765b6116717f6ef55971ffb07d3bee56bd48b4772653')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  ./configure --prefix="${pkgdir}/usr" --sbindir="${pkgdir}/usr/bin"
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
  make -C "${srcdir}/${pkgname}-${pkgver}" install
  set +u
}
set +u
