# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=0.8.2-1
pkgrel=1
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
license=('LicenseRef-1Password-Proprietary')
options=(!strip)
url='https://1password.com/'
source=("https://onepassword.s3.amazonaws.com/linux/debian/pool/main/1/1password/1password-$pkgver.deb")
sha256sums=('71c3947e4520a03f463f39fd9ed21bd475f004fad23aec6adc1b836bbbced72c')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"/
}
