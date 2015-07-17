# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Oleg Andreev <olegoandreev@yandex.ru>
pkgname=purple-vk-plugin
pkgver=0.9+r346
pkgrel=1
pkgdesc="Plugin for Pidgin, adding Vk.com support"
arch=('i686' 'x86_64')
url="http://bitbucket.org/olegoandreev/purple-vk-plugin"
license=('GPL3')
depends=('libpurple' 'libxml2')
makedepends=('cmake')
options=('!strip')
source=("https://bitbucket.org/olegoandreev/purple-vk-plugin/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2ed87184f839a86f4569deb88d0cc0f219c96be18d6ca44bb0bb197f28828176')

build() {
  cd "${pkgname}-${pkgver}"

  cd "build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"

  make DESTDIR=${pkgdir} install
}
