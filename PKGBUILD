# Maintainer: travisghansen <travisghansen@yahoo.com>

_pkgname="objectivefs"
pkgname=objectivefs-bin
pkgver=7.1
pkgrel=1
pkgdesc="Scalable High Performance File Storage"
arch=(aarch64 x86_64)
url="https://objectivefs.com/"
license=('custom: ObjectiveFS')
source=("https://objectivefs.com/license")
source_x86_64=("https://objectivefs.com/user/download/ac24htfht/objectivefs_${pkgver}_amd64.deb")
source_aarch64=("https://objectivefs.com/user/download/ac24htfht/objectivefs_${pkgver}_arm64.deb")
sha256sums=('31cd1089a1438e5a8d1d3be1bdc67c646a161b6b1fbcd22ac083660ae6ae8f0c')
sha256sums_aarch64=('7c31436713dbf26f2edab1b4c1b4e9d179a1468ae2da6b6eaadc503ae842ef44')
sha256sums_x86_64=('f8c9531290ce6db60c1517e483e154bb83b4843e8ac7b6ddd3e4a4efa8d158d5')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
  install -D -m644 license "${pkgdir}/usr/share/licenses/${_pkgname}/license"
  mkdir -p "${pkgdir}/usr/bin/"
  mv "${pkgdir}/sbin/mount.objectivefs" "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/sbin"
  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"
}
