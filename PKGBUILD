# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.7.0
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
sha256sums_i686=('c065893debef6d1cb9c8fa7ed2c024940c005ae31c8d708bf390cf102375b8f2')
sha256sums_x86_64=('3b7f909a4a3cf9c5cdc9354ef34ff683eaaf2ce47054850bf1747ff8bfa4fc8d')

package() {
  cd "${srcdir}"

  if [ "${CARCH}" = "x86_64" ]; then
      install -Dm755 "${srcdir}/${_pkgname}_linux_amd64" "$pkgdir/usr/bin/${_pkgname}"
  else
      install -Dm755 "${srcdir}/${_pkgname}_linux_386" "$pkgdir/usr/bin/${_pkgname}"
  fi
}

