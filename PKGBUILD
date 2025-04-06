# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: David < david at rjamo dot dev >
# Contributor: Tom < reztho at archlinux dot us >

pkgname=libpkcs11-fnmtdnie
pkgver=1.6.9
pkgrel=1
pkgdesc="PKCS11 library for DNIe and FNMT cards (Multicard)"
arch=('x86_64')
url="https://www.sede.fnmt.gob.es/descargas/descarga-software"
license=('custom')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'libgpg-error' # libgpg-error.so
  'perl'
  'pcsclite' "libpcsclite.so"
  'pcsc-tools'
  'ccid'
  'ca-certificates-dnie'
  'ca-certificates-fnmt'
)

install="${pkgname}.install"
source=("https://www.sede.fnmt.gob.es/documents/10445900/11635653/libpkcs11-fnmtdnie_${pkgver}_amd64.deb")
sha256sums=('59b16f112f4bcfc7d4b328497bdb04c3b603e4fdfcde4579b9f39024fc5946fb')
options=('debug')

package() {
  cd "${srcdir}/"
  tar --zstd -xf data.tar.zst
  mv usr "${pkgdir}/"
  rm -fr "${pkgdir}/usr/share/applications"
  rm -fr "${pkgdir}/usr/share/libpkcs11-fnmtdnie"
}
