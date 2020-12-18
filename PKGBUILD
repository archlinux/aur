# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Build automation for the container era'
arch=('x86_64')
url='https://earthly.dev'
license=('MPL-2.0')
install=${pkgname}.install
depends=(
 'docker'
 'git'
)

source=(
  "https://github.com/earthly/earthly/releases/download/v${pkgver}/earthly-linux-amd64"
)
sha512sums=(
  'c2c52d5e0547a7f67efbfb7381713854952e1aa930c920238bbdaa4a92a998a2239175dbe322379f22b1a76a3da3dd44b3781f0467f741f5ba4997641ef09592'
)

prepare() {
  chmod +x earthly-linux-amd64
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/earthly-linux-amd64" "${pkgdir}/usr/bin/earthly"
  ln -s "${pkgdir}/usr/bin/earthly" "${pkgdir}/usr/bin/earth"
}
