# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

pkgname=wipemychat
pkgver=1.1.0
pkgrel=3
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=('any')
url="https://github.com/rusq/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('go' 'openssl')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8ac2bd483fc212a951474e6da46216136486c8fe6d8bb1cb7c237ea69502a3c')

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "tgmsgdel" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
