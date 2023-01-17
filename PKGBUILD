# Maintainer: lmbbrkr <lmbbrkr at protonmail dot ch>

pkgname=lxd-snapper-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.0
pkgrel=1
pkgdesc="LXD snapshots, automated"
arch=('x86_64')
url="https://github.com/Patryk27/lxd-snapper"
license=('MIT')
depends=('lxd>=4.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-linux64::${url}/releases/download/v${pkgver}/lxd-snapper-linux64"
        "LICENSE::https://raw.githubusercontent.com/Patryk27/lxd-snapper/master/LICENSE")
sha256sums=('d4f86a91928752202f2ac25f1b54935cb850107d47713007b89e0f80525e37cd'
            '161d3e4f2761b10a75f7fd88de8a66319d3017e67e77491e2da90a521fc1383a')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-linux64" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
