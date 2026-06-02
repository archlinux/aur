# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>
# Co-maintainer: crazybrain <crazybrain + aur at tuta dot com>

_pkgname=min-ed-launcher
pkgname=${_pkgname}-bin
pkgver=v0.13.0
pkgrel=1
pkgdesc="Minimal Elite Dangerous Launcher"
arch=('x86_64')
url="https://github.com/Rfvgyhn/min-ed-launcher"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
install="${_pkgname}.install"
changelog=CHANGELOG.md
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_linux-x64.tar.gz"
	"CHANGELOG.md"
	"${_pkgname}.install")
sha512sums=('54a0df7e87a47498807882b7bcb0a07804f4290a64989a900e6bc5fb07aa2398f5fd66f21371184b45d000f4badb667a3fee1e49c4dc8fcd903ca63b81df1cf4'
            '2c1ef9150b9ea1a20a8837e974b195c3d703c97bbb2969dd3d750db404f480214d51a6473ea82c062d4f798a5a296f6f64aab19129176bb877447b53989854fa'
            '33d77b3f3511bf97f5166a8a909744954e1047929dc416db2fe76b0bd52425e02ceba8cad0a416df53e004ca48e68f7bbfd1227e015253345c8495e691b07e2f')

package() {
  # Make directory
  install -d "${pkgdir}"/opt/min-ed-launcher
  install -d "${pkgdir}"/usr/bin

  # Copy files
  cd "$srcdir/${_pkgname}_${pkgver}_linux-x64"
  install -Dm644 CHANGELOG.md "${pkgdir}"/opt/min-ed-launcher/CHANGELOG.md
  install -Dm755 MinEdLauncher "${pkgdir}"/opt/min-ed-launcher/MinEdLauncher
  install -Dm644 README.md "${pkgdir}"/opt/min-ed-launcher/README.md

  # Make symlink
  ln -sf /opt/min-ed-launcher/MinEdLauncher "${pkgdir}"/usr/bin/MinEdLauncher
  ln -sf /usr/bin/MinEdLauncher "${pkgdir}"/usr/bin/minedlauncher
}
