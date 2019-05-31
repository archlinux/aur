# Maintainer Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=geolocate-git
pkgbase=geolocate
pkgver=r3.5804c60
pkgrel=1
pkgdesc="Obtain your latitude and longitude in a simplistic format (based on your ip)"
url="https://github.com/Baitinq/geolocate"
depends=('bash' 'curl')
makedepends=('git')
license=('GPL')
arch=('any')
source=("git+https://github.com/$author/$pkgname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install the program.
  install -Dm755 geolocate "${pkgdir}/usr/bin/geolocate"
}
