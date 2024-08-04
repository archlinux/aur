# Maintainer: pldubouilh <pldubouilh at gmail dot com>

pkgname=bluebao
pkgdesc="simple bluetooth audio devices manager that lives on the tray"
pkgver=1.0.0
pkgrel=1
arch=('x86_64' 'aarch64')
license=('MIT')
url='https://github.com/pldubouilh/bluebao'
provides=('bluebao')
depends=('glibc' 'libpulse' 'bluez-utils')
makedepends=('go' 'make' 'pkgconf' 'git' 'gcc' 'gtk3' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}::git+https://github.com/pldubouilh/bluebao#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  make build
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}