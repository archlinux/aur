# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.5.20
pkgrel=2
pkgdesc='Build automation for the container era'
arch=('x86_64')
url='https://earthly.dev'
license=('custom:BSL', 'MPL-2.0')
install=${pkgname}.install
depends=(
  'docker'
  'git'
)

source=(
  "${pkgname}-${pkgver}::https://github.com/earthly/earthly/releases/download/v${pkgver}/earthly-linux-amd64"
)
sha512sums=(
  '6624f6dd2b6bccfb99d4811e99353b07965f48349fcd50676e6c2964dddc04f3b41a0b6ae78f27bff83cfdd82bc8997e7ade761705209f63afafa3dbd8451a0c'
)

prepare() {
  chmod +x ${pkgname}-${pkgver}
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/earthly"
  ln -s "${pkgdir}/usr/bin/earthly" "${pkgdir}/usr/bin/earth"
}
