# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Ataberk Özen <ataberkozen123@gmail.com>
# Contributor: Bruno Nova <brunomb.nova@gmail.com>
pkgname=nautilus-admin-gtk4
pkgver=1.2.0
pkgrel=2
epoch=1
pkgdesc="Extension for Nautilus to do administrative operations"
arch=('any')
url="https://github.com/MacTavishAO/nautilus-admin-gtk4"
license=('GPL-3.0-or-later')
depends=(
  'nautilus-python'
  'polkit'
)
makedepends=(
  'cmake'
  'git'
)
provides=('nautilus-admin')
conflicts=('nautilus-admin')
source=("git+https://github.com/MacTavishAO/nautilus-admin-gtk4.git#tag=$pkgver")
sha256sums=('74d6af5bcef95db0d99a90b8453444400b8754895ae9194af3854d9b6771df97')

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_POLICY_VERSION_MINIMUM='3.5' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
