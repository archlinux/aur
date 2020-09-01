# Maintainer: Alexander Bruegmann <mail[at]abruegmann[dot]eu>
# Contributor: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=0.8.4
pkgrel=1
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
license=('custom:LicenseRef-1Password-Proprietary')
#options=(!strip)
url='https://1password.com/'
source=("https://onepassword.s3.amazonaws.com/linux/debian/pool/main/1/1password/1password-$pkgver.deb")
sha256sums=('81b8de44a491d6f125e3ea57ce86749357ebfe0fab9e350e4353768f3778ad10')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"/
}
