## Maintainer: pyamsoft <pyam.soft@gmail.com>

pkgname=steam-wrapper
pkgdesc="Steam wrapper for common operations"
pkgver=0.2.4
pkgrel=1
arch=('i686' 'x86_64')
optdepends=('steam-native: Native runtime library support' \
        'steam-libs: Native steam libraries support')
depends=('steam' 'bash' 'coreutils' 'findutils')
makedepends=()
provides=('steam-wrapper')
conflicts=('steam-wrapper')
license=('GPLv2')
url="https://github.com/pyamsoft/${pkgname}"
source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('09b2f6258ddf5a5295d6d72a2e573e2ff095948eb75bc96837f13bf37a9df8ec')

package() {
  cd "$srcdir"/"$pkgname-$pkgver"

  # Install the script
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install the desktop file
  install -Dm644 "${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the default configuration
  install -Dm 644 "${pkgname}.conf" \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}

