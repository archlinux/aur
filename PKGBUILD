# Maintainer: Mercas <me@smj.im>

pkgname=anytype-alpha
pkgver=0.45.13
_tag="-alpha" # -alpha, -beta or leave blank
pkgrel=1
pkgdesc="The everything app for those who celebrate trust & autonomy"
arch=('x86_64')
url="https://anytype.io/"
license=('custom')
depends=('glibc' 'glib2' 'nss' 'gcc-libs' 'bash' 'libxss' 'libsecret')
optdepends=('org.freedesktop.secrets: auto login support')
conflicts=('anytype-bin'
  'anytype-electron-bin'
  'anytype-alpha-bin')
options=('!strip' '!debug')
source=("https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}${_tag}/anytype_${pkgver}${_tag}_amd64.deb")
sha256sums=('0634ea2747fd7b4405708bfe6e0fbb2b1f9d1580cd6cb58e0c57eb67d984f266')

package() {
  echo "Extract data.tar.xz ..."
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/Anytype/anytype" "$pkgdir"/usr/bin/anytype
}
