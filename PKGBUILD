# Maintainer: Anton Palgunov <toxblh@gmail.com>

pkgname=1password-bin
_pkgname=1Password
_binname=1password
pkgver=0.8.1
pkgrel=1
pkgdesc="Password manager and secure wallet"
arch=('x86_64')
license=('LicenseRef-1Password-Proprietary')
options=(!strip)
url='https://1password.com/'
source=("https://onepassword.s3.amazonaws.com/linux/debian/pool/main/1/1password/1password-$pkgver.deb")
sha256sums=('eb0baa7cab7e7fee26e4a8f01d758ea0bbb3f18d54d54b57f372cdd931e729e7')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/${_binname}" "${pkgdir}/usr/bin"/
}
