# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.7.1
pkgrel=1
pkgdesc="Json incremental digger"
url="https://github.com/simeji/jid"
arch=("i686" "x86_64")
license=("MIT")
provides=("jid")
conflicts=("jid" "jid-git")
depends=("glibc")
source_i686=("https://github.com/simeji/jid/releases/download/${pkgver}/${_pkgname}_linux_386.zip")
source_x86_64=("https://github.com/simeji/jid/releases/download/${pkgver}/${_pkgname}_linux_amd64.zip")
sha256sums_i686=('772bdb653769ca50aa9cbc124889f0a3df05028b1745d718ee66c1cb244b7b68')
sha256sums_x86_64=('97602a7120462fbaa6cea74f33e2e908a418755d9fcac9d7718565bf6ef52a48')

package() {
  cd "${srcdir}"

  if [ "${CARCH}" = "x86_64" ]; then
      install -Dm755 "${srcdir}/${_pkgname}_linux_amd64" "$pkgdir/usr/bin/${_pkgname}"
  else
      install -Dm755 "${srcdir}/${_pkgname}_linux_386" "$pkgdir/usr/bin/${_pkgname}"
  fi
}

