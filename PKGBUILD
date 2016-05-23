## Maintainer: pyamsoft <pyam.soft@gmail.com>

pkgname=steam-wrapper
pkgdesc="Steam wrapper for common operations"
pkgver=0.2.6
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
sha256sums=('3f150bdfa52006865b29e82cb8571b2a872e977d15710a7af2be6649ba9c9297')

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

