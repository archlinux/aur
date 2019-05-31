# Maintainer Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=geolocate-git
pkgbase=geolocate
pkgver=geolocate.r1.53fb9b1
pkgrel=1
pkgdesc="Obtain an ip's approximate latitude and longitude in a simplistic format (latitude:longitude)"
url="https://github.com/Baitinq/geolocate"
depends=('bash' 'curl' 'jq' 'gnu-netcat')
makedepends=('git')
license=('GPL')
arch=('any')
source=("https://github.com/Baitinq/geolocate")
provides=('geolocate')

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgdir}/${pkgbase}"

  # Install the program.
  install -Dm755 geolocate "${pkgdir}/usr/bin/geolocate"
}
