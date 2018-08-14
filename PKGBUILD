# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy
pkgver=7.2.0
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy"
license=('unknown')
source=("${pkgname}-${pkgver}.tar.gz::https://aka.ms/downloadazcopylinuxrhel6")
sha512sums=('e4ad3c271c3491c798699e164d0b770ba745a611f06dea399441902b0fc927226481a1269541189b993a54ba3cd364e29b6347d5adedaf7bdf72ec78932ebe5b')

package() {
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/usr/lib/azcopy"
  cp -r * "${pkgdir}/usr/lib/azcopy/"
  install -Dm755 startup "${pkgdir}/usr/bin/azcopy"
}
