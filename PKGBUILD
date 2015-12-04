## Maintainer: pyamsoft <pyam.soft@gmail.com>

pkgname=steam-wrapper
pkgdesc="Steam wrapper for common operations"
pkgver=0.2.0
pkgrel=1
arch=('i686' 'x86_64')
optdepends=('steam-native: Native runtime library support' \
        'steam-libs: Native steam libraries support')
depends=('steam' 'bash' 'coreutils' 'findutils')
makedepends=()
provides=('steam-wrapper')
conflicts=('steam-wrapper')
license=('GPLv2')
url="https://github.com/pyamsoft/${pkgname}/archive/${pkgver}.tar.gz"
source=("$url")
sha256sums=('bdda8a62d446e416725b919a629e83be5c68f688f23da8025ac50d257f8acc86')

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

