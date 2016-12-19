# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.6.2
pkgrel=2
pkgdesc="Json incremental digger"
url="https://github.com/simeji/jid"
arch=("i686" "x86_64")
license=("MIT")
provides=("jid")
conflicts=("jid" "jid-git")
depends=("glibc")
source_i686=("https://github.com/simeji/jid/releases/download/${pkgver}/${_pkgname}_linux_386.zip")
source_x86_64=("https://github.com/simeji/jid/releases/download/${pkgver}/${_pkgname}_linux_amd64.zip")
sha256sums_x86_64=('7f4c7e4d56e82adda3cf596bee975e5adb778c50381e3d20e4e41bb987ff36f6')
sha256sums_x86_64=('17bf8657edd74e570286018d86a4a8835ced0e9ea1ea79b5284f9caa9355275f')

package() {
  cd "${srcdir}"

  if [ "${CARCH}" = "x86_64" ]; then
      install -Dm755 "${srcdir}/${_pkgname}_linux_amd64" "$pkgdir/usr/bin/${_pkgname}"
  else
      install -Dm755 "${srcdir}/${_pkgname}_linux_386" "$pkgdir/usr/bin/${_pkgname}"
  fi
}

