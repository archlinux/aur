# Maintainer: banbanchs <memory.silentvoyage@gmail.com>

pkgname=jid-bin
_pkgname=jid
pkgver=0.7.2
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
sha256sums_i686=('62ec94b54f767b2d9873b6d460d7832fcfea33d585313d4c40ff55f7e059858a')
sha256sums_x86_64=('57d9e6cb6dcd052d7ffcfddd7bc88fd5a07351a9bdf0575d3355a9921153e177')

package() {
  cd "${srcdir}"

  if [ "${CARCH}" = "x86_64" ]; then
      install -Dm755 "${srcdir}/${_pkgname}_linux_amd64" "$pkgdir/usr/bin/${_pkgname}"
  else
      install -Dm755 "${srcdir}/${_pkgname}_linux_386" "$pkgdir/usr/bin/${_pkgname}"
  fi
}

