# Maintainer: Mercas <me@smj.im>

pkgname=anytype-pre
pkgver=0.46.0
_tag="-primitives3"
pkgrel=1
pkgdesc="The everything app for those who celebrate trust & autonomy (pre-release)"
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
sha256sums=('f67814c552b1af727dfc89fb4637b7da00c3803b13cfe9ca8080c13048162679')

package() {
  echo "Extract data.tar.xz ..."
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/Anytype/anytype" "$pkgdir"/usr/bin/anytype
}
