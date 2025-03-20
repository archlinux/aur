# Maintainer: Mercas <me@smj.im>

pkgname=anytype-alpha
pkgver=0.45.14
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
sha256sums=('172fa7f46837a97ac6a06e9d7797b300511b7b5680ade03c5c0dda30f6156759')

package() {
  echo "Extract data.tar.xz ..."
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/Anytype/anytype" "$pkgdir"/usr/bin/anytype
}
