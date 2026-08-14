# Maintainer: fuero <fuerob@gmail.com>
_pkgname=zync
pkgname="${_pkgname}-bin"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# renovate: datasource=github-releases depName=zync-sh/zync
pkgver=2.22.5
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
sha256sums=('bee683efa49424e6e7e15e3f72a2b24a695760d698ce2f7d87d5f04dc1163224'
            'f0d43dfea4c354d4c46f8380d7deb3d065701ad335c70fc7366a1c971ce32c60')

package() {
  tar xzf data.tar.gz

  mv usr "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
