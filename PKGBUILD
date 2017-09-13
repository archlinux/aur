# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_pkgbasename=op
pkgname=$_pkgbasename-bin
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="1Password CLI"
arch=('i686' 'x86_64' 'arm')
url="https://app-updates.agilebits.com/product_history/CLI"
license=('UNLICENSED')
provides=('op')
source_x86_64=("https://cache.agilebits.com/dist/1P/$_pkgbasename/pkg/v$pkgver/op_linux_amd64_v${pkgver}.zip")
md5sums_x86_64=('8123b36d28817c64a3faa13a582cb191')
source_i686=("https://cache.agilebits.com/dist/1P/$_pkgbasename/pkg/v$pkgver/op_linux_386_v${pkgver}.zip")
md5sums_i686=('1818e539d28b34ea338024e99f3f6472')
source_arm=("https://cache.agilebits.com/dist/1P/$_pkgbasename/pkg/v$pkgver/op_linux_arm_v${pkgver}.zip")
md5sums_arm=('dca7bf7ba56b7911f0800452a4034535')

check() {
  gpg --verify-files ${srcdir}/op.sig
}

package() {
  mkdir -p ${pkgdir}/usr/bin

  cp "${srcdir}/op" \
     "${pkgdir}/usr/bin/op"
}
