# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy
pkgver=7.2.0
pkgrel=2
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy"
license=('unknown')
source=("${pkgname}-${pkgver}.tar.gz::https://aka.ms/downloadazcopylinux64")
sha512sums=('7b88f1c9173c35b1153a8c0b3cd95beef6667b9ada4fea5796318a1f6b91a89431a79874d432cd3fb98fa12f6b1142ce64c81aa921fc73ace736302617052715')
options=(!strip libtool staticlibs)

package() {
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}/usr/lib/azcopy"
  cp -r * "${pkgdir}/usr/lib/azcopy/"
  install -Dm755 startup "${pkgdir}/usr/bin/azcopy"
}
