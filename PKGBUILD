# Maintainer:  r1cebank <rbnk@elica.io>

pkgname=alchitry-labs-bin
_pkgname=alchitry-labs
pkgver=1.1.6
pkgrel=2
pkgdesc='Alchitry Labs - The Easiest Way to Program FPGAs'
arch=(x86_64)
license=('custom: commercial')
url='https://alchitry.com/pages/alchitry-labs'
provides=(alchitry-labs)
conflicts=(alchitry-labs)
depends=('java-environment>=8')
source=("$pkgname-$pkgver.tar.gz::https://cdn.alchitry.com/labs/alchitry-labs-$pkgver-linux.tgz" "${_pkgname}.desktop")
sha256sums=("52f63a8b2549c287dd5e7d6932d0e0098beaa5cf4c239cdd1d7cdb290016bb79"
            "bd74a04852e5b7aa5b4764602900cadcccf7be22579a3e8090ee04a8f723c51b")

package() {
  cd "${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/"{applications,icons}
  install -d "${pkgdir}/usr/bin"
  # Copy the whole SDK
  cp -a . "${pkgdir}/usr/share/${_pkgname}"

  install -m644 "${pkgdir}/usr/share/${_pkgname}/icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  chmod +x "${pkgdir}/usr/share/${_pkgname}/alchitry-labs"
  ln -s "/usr/share/${_pkgname}/alchitry-labs" "${pkgdir}"/usr/bin/alchitry-labs
}
