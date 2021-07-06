# Maintainer: Thomas Girod <tgirod@altu.fr>
# Co-Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=open-stage-control
pkgver=1.9.11
pkgrel=1
pkgdesc='A libre desktop OSC bi-directional control surface application'
arch=(i686 x86_64 armv7h aarch64)
url='http://osc.ammd.net/'
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
optdepends=('python-rtmidi: send and receive midi messages')
makedepends=('npm')
source=("https://github.com/jean-emmanuel/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux-x64.zip")

_name=${pkgname}-${pkgver}-linux-x64

package() {
  cd ${srcdir}/${_name}
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R * ${pkgdir}/opt/${pkgname}

  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/open-stage-control"
}

sha256sums=('a13c1002905c86892ed1a743277f94dc8d7903d9ad9a9e9122cc2746b475d36a')
