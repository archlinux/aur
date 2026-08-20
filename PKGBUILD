# Maintainer: fuero <fuerob@gmail.com>
_pkgname=zync
pkgname="${_pkgname}-bin"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# renovate: datasource=github-releases depName=zync-sh/zync
pkgver=2.24.0
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
sha256sums=('0893eb81ad8b3517dc0cafd39eb5d57de9b9e0cf1d8d5fba5db22b997776e536'
            'f0d43dfea4c354d4c46f8380d7deb3d065701ad335c70fc7366a1c971ce32c60')

package() {
  tar xzf data.tar.gz

  mv usr "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
