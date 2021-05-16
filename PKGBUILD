# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Forked from the chia-gui package by Clansty
_name='chia-blockchain'
pkgname="${_name}-gui"
pkgver=1.1.5
pkgrel=1
pkgdesc="Chia is a peer-to-peer network based digital currency based on proof-of-space - Electron GUI and CLI client"
arch=('x86_64')
url="https://www.chia.net/"
license=('Apache')
depends=('electron11')
conflicts=('chia')
provides=('chia' 'chia-gui')
options=('!strip')
source=("https://github.com/Chia-Network/${_name}/releases/download/${pkgver}/${_name}_${pkgver}_amd64.deb")
sha256sums=('92c2a3eff148d6285c6f0816b932023fd321e2e659980aa6da819fbbe0630941')

package() {
  bsdtar -xf data.tar.xz -C ./
  cp  -r "${srcdir}/usr/" "${pkgdir}/usr/"
  ln -s /usr/lib/chia-blockchain/resources/app.asar.unpacked/daemon/chia "${pkgdir}/usr/bin/chia"
}

