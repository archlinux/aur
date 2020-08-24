# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=0.8.3
_pkgver=0.8.3-1
pkgrel=1
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
license=('custom:LicenseRef-1Password-Proprietary')
options=(!strip)
url='https://1password.com/'
source=("https://onepassword.s3.amazonaws.com/linux/debian/pool/main/1/1password/1password-$_pkgver.deb")
sha256sums=('e6f4c4e8c0e6edd53a4ad85ec0de65398322569215b7df6bca47cf69d7e25f0a')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"/
}
