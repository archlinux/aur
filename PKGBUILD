# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
# Contributor: Keithsel <keithsel@disroot.org>

pkgname=magic-context-dashboard-bin
_pkgname=magic-context-dashboard
pkgver=0.21.3
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
sha256sums=('a674cea6e3c452c638fa0bb8e08e2a544730f4840176c171b8799f090b5c433a'
            '66d8947518a0b3efefa01a1615249f6e2d99b9308379628dafb0abcabc8b128a')
noextract=("${_pkgname}-${pkgver}.deb")

package() {
  bsdtar -O -xf "${srcdir}/${_pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xf -

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
