# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.6.3
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
sha256sums_i686=('9770ac445b64170dbb5dc23b739cb458043257efd56dde36b95671a72a56a863')
sha256sums_x86_64=('3519711e65c896edfdfbb65a0117af4badc24cb7d02a2584d9d1470e81ab4136')

package() {
  cd "${srcdir}"

  if [ "${CARCH}" = "x86_64" ]; then
      install -Dm755 "${srcdir}/${_pkgname}_linux_amd64" "$pkgdir/usr/bin/${_pkgname}"
  else
      install -Dm755 "${srcdir}/${_pkgname}_linux_386" "$pkgdir/usr/bin/${_pkgname}"
  fi
}

