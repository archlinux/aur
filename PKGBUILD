# Maintaner: JackMacWindows <jackmacwindowslinux@gmail.com>
# Co-Maintainer: Thomas Girod <tgirod@altu.fr>
# Co-Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=open-stage-control-bin
_pkgname=open-stage-control
pkgver=1.23.0
pkgrel=1
pkgdesc='A libre desktop OSC bi-directional control surface application'
arch=(x86_64)
url='http://openstagecontrol.ammd.net/'
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
optdepends=('python-rtmidi: send and receive midi messages')
makedepends=('npm')
replaces=('open-stage-control')
source=("https://github.com/jean-emmanuel/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-x64.zip")

_name=${_pkgname}_${pkgver}_linux-x64

package() {
  cd ${srcdir}/${_name}
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -R * ${pkgdir}/opt/${pkgname}

  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/open-stage-control"
}

sha256sums=('b1c3dced79182dc7e3c1db4b6902bae78e120ba87eb6d1e1ca78de5118fd6fa5')
