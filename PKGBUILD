# Maintainer: Amolith <amolith@secluded.site>
pkgname="goradion-bin"
_pkgname=${pkgname%-bin}
pkgdesc="Terminal based online radio player"
pkgver="v0.7.0"
pkgrel=1
arch=("x86_64" "aarch64")
url="https://github.com/agejevasv/goradion"
license=("Unlicense")
depends=("mpv")
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("${_pkgname}-${pkgver}-x86_64"::"${url}/releases/download/${pkgver}/${_pkgname}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64"::"${url}/releases/download/${pkgver}/${_pkgname}-linux-arm64")
b2sums_x86_64=('b86c15e0806e7ae2b4d0a5d6ecd7bff301e2daf725a8ba2b4e0cc17c343273acf3ac05a0a4e89ce7f36477a20229d39ee43bc10df4f876bc84c7f0052c6649ce')
b2sums_aarch64=('53a57f083efd34881d37b49b036a85523504c693233868e12027b8cd9c3fe60094827d535af482267aed6b79e81e9651d1ca86cd7ae999b1bdd264a00af035af')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_pkgname"
}
