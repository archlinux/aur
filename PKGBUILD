# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=0.8.0.22506
pkgrel=1
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
license=('LicenseRef-1Password-Proprietary')
options=(!strip)
url='https://1password.com/'
source=("https://onepassword.s3.amazonaws.com/linux/debian/pool/main/1/1password/1password-$pkgver.deb")
sha256sums=('f93fa85b696e42dd09c7936a40722f9ef536d6849b4d92d00c49e77887f45c40')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"/
}
