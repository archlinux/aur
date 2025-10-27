# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mateusz Slazynski <ceceron@gmail.com>

pkgname=pidgin-kwallet
pkgver=1.1.0
pkgrel=9
pkgdesc="KWallet plugin for Pidgin"
arch=('x86_64')
url="https://www.linux-apps.com/content/show.php/Pidgin+KWallet+Plugin?content=127136"
license=('GPL')
depends=('libpurple' 'kwallet')
makedepends=('cmake')
# The original url is dynamically generated at regular intervals and cannot be relied on.
source=("https://sources.archlinux.org/other/packages/$pkgname/127136-PidginKWallet-$pkgver.tar.bz2")
sha512sums=('836bd2acefe9f6e9adc157217d917dfcf9bf8acc9934f9f036c367c9424a730f036174c3ef273f84677a60bb098146606ef59fb6de3a1c9708fb5e2fbac59adc')

build() {
  cmake -S PidginKWallet-$pkgver -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
