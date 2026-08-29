# Maintainer: fuero <fuerob@gmail.com>
_pkgname=zync
pkgname="${_pkgname}-bin"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# renovate: datasource=github-releases depName=zync-sh/zync
pkgver=2.27.1
pkgrel=1
pkgdesc='Open-source SSH client for developers & DevOps with SFTP, tunneling, and a modern terminal.'
arch=('x86_64')
url='https://zync.thesudoer.in/'
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'libappindicator'
  'librsvg'
  'openssl'
)
source=(
  "https://github.com/zync-sh/zync/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
  https://github.com/zync-sh/zync/blob/main/LICENSE
)
sha256sums=('8d5cd1d21aa30b74822458d45f8dcf4ba184a98082ac1e483e0c956f251cf057'
            'f0d43dfea4c354d4c46f8380d7deb3d065701ad335c70fc7366a1c971ce32c60')

package() {
  tar xzf data.tar.gz

  mv usr "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
