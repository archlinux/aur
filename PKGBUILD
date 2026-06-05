# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=peerbeat-bin
_pkgname=peerbeat
pkgver=0.1.1
pkgrel=1
pkgdesc="Local-first music player with LAN peer-to-peer sharing (prebuilt binary)"
arch=('x86_64')
url="https://github.com/RamazanBerk20/PeerBeat"
license=('GPL-3.0-or-later')
depends=('gtk3' 'alsa-lib')
provides=('peerbeat')
conflicts=('peerbeat')
options=('!strip')
source=("PeerBeat-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/PeerBeat-${pkgver}-linux-x86_64.tar.gz"
        "peerbeat.desktop::${url}/raw/v${pkgver}/packaging/linux/peerbeat.desktop"
        "PeerBeat.png::${url}/raw/v${pkgver}/assets/icon/PeerBeat.png")
sha256sums=('a4eb1455d012c671f6be359992f46f93a70672e6a48e604af68efe92762ab8a4'
            'ddc45118db49b11a954d811200cf7479dbbec9e9ef2bedbfaa2bd5e7eb86ca30'
            '562d8fe3b0ffc5f2c2a2ae81aa43f95a20a85875950b82b30e589c0695c7c9f0')

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}/." "${pkgdir}/opt/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/peerbeat.desktop" \
    "${pkgdir}/usr/share/applications/peerbeat.desktop"
  install -Dm644 "${srcdir}/PeerBeat.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/peerbeat.png"
}
