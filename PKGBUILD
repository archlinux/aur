# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=lxd-snapper-bin
_pkgname="${pkgname%-bin}"
pkgver=1.2
pkgrel=1
pkgdesc="LXD snapshots, automated"
arch=('i686' 'x86_64')
url="https://github.com/Patryk27/lxd-snapper"
license=('MIT')
depends=('lxd>=4.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_i686=("${_pkgname}-${pkgver}-i686::${url}/releases/download/v${pkgver}/lxd-snapper-linux32")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/lxd-snapper-linux64")
source=("LICENSE::https://raw.githubusercontent.com/Patryk27/lxd-snapper/master/LICENSE")
sha256sums=('161d3e4f2761b10a75f7fd88de8a66319d3017e67e77491e2da90a521fc1383a')
sha256sums_i686=('dfd9368b974bdbe1930b17aa777ad65316c279151e647ebdfa189d5cd6029fb1')
sha256sums_x86_64=('56f437ccd250b18ae83a1b32b08adbdef9d098716e28574a18989b283ba525d4')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
