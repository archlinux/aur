# Maintainer: Thomas Girod <tgirod@altu.fr>
# Co-Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=open-stage-control
pkgver=1.19.1
pkgrel=1
pkgdesc='A libre desktop OSC bi-directional control surface application'
arch=(i686 x86_64 armv7h aarch64)
url='http://openstagecontrol.ammd.net/'
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

sha256sums=('9cce633aedbb9a74c517b72cac47a6388ac64fc87fecf869684fd5dc3233e51c')
