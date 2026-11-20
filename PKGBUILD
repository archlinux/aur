# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
# Contributor: Keithsel <keithsel@disroot.org>

pkgname=magic-context-dashboard-bin
_pkgname=magic-context-dashboard
pkgver=0.21.0
pkgrel=1
pkgdesc="Dashboard for Magic Context"
arch=('x86_64')
url="https://github.com/cortexkit/magic-context"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'openssl-3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_pkgname}-${pkgver}.deb::https://github.com/cortexkit/magic-context/releases/download/dashboard-v${pkgver}/magic-context-dashboard-linux-x64.deb"
        "LICENSE::https://raw.githubusercontent.com/cortexkit/magic-context/dashboard-v${pkgver}/LICENSE")
sha256sums=('e790e057105e54bbbe53ed22b87b8cc614b75673f792a7b5abc4419fe7d04468'
            '66d8947518a0b3efefa01a1615249f6e2d99b9308379628dafb0abcabc8b128a')
noextract=("${_pkgname}-${pkgver}.deb")

package() {
  bsdtar -O -xf "${srcdir}/${_pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
