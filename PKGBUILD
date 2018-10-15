# Maintainer: Fredy García <frealgagu at gmail fot com>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=etcher-bin
pkgver=1.4.5
pkgrel=1
pkgdesc="Flash OS images to SD cards & USB drives, safely and easily"
arch=("x86_64")
url="http://www.${pkgname%-bin}.io/"
license=("apache")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("alsa-lib" "gconf" "gtk2" "libxss" "libxtst" "nss")
optdepends=("libnotify: for notifications"
	        "speech-dispatcher: for text-to-speech")
source=("https://github.com/resin-io/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-electron_${pkgver}_amd64.deb")
options=("!strip")
sha256sums=("8d55cddc740523fc61ee933d912e4277734add4aae55cf92e0265cddd14ae63e")

build() {
  cd "${srcdir}"
  mkdir "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  cd "${srcdir}"
  cp -r "${srcdir}/output/"* "${pkgdir}"
}
