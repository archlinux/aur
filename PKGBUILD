# Maintainer: Michael Arthur Long <adhaxclient at hotmail dot com>

_pkgname=min-ed-launcher
pkgname=${_pkgname}-bin
pkgver=v0.11.1
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
sha512sums=('b6b315b40d9d51f49c9e2098efa76194335f53a29a79ce611d2c5a4380faeb1b50b94eac25cc697e3e24c4ff045a7a8ea894d0e2331edbad46edf520aa564f5d'
            '2046eac2eadd6a017688fd31d1e8f4f7049d85ca85ebb90cdf7df3acafedd38dc26847a00a51b723bbf68f14d1232c3b6082492612f763b60912139707765aed'
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
