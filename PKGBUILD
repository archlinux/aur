# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=dep-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Go dependency management tool"
arch=('x86_64' 'i686')
url="https://github.com/golang/dep"
license=('BSD')
conflicts=('dep')
provides=('dep')
source=("LICENSE")
source_i686=("${url}/releases/download/v${pkgver}/dep-linux-386")
source_x86_64=("${url}/releases/download/v${pkgver}/dep-linux-amd64")
sha256sums=("69c47f09a7aec01c59ff1bdc346406d36e84df11461fb2bed92b0d185a7a2ccb")
sha256sums_i686=("beba05c2af3d584fc2707c92e66f0fded2927114552c3c60ec8215c0bf703ea0")
sha256sums_x86_64=("287b08291e14f1fae8ba44374b26a2b12eb941af3497ed0ca649253e21ba2f83")

package() {
  if [ "${CARCH}" == "x86_64" ]; then
    install -Dm755 "${srcdir}/dep-linux-amd64" "${pkgdir}/usr/bin/dep"
  else
    install -Dm755 "${srcdir}/dep-linux-386" "${pkgdir}/usr/bin/dep"
  fi

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
