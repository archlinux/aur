# Maintainer Manuel Palenzuela <sadshinobi@protonmail.com>

author=Baitinq
pkgname=geolocate-git
pkgbase=geolocate
pkgver=r13.3c5f8a1
pkgrel=1
pkgdesc="Obtain an ip's approximate latitude and longitude in a simplistic format (latitude:longitude)"
url="https://github.com/Baitinq/geolocate"
depends=('bash' 'curl' 'jq' 'gnu-netcat')
makedepends=('git')
license=('GPL')
arch=('any')
source=("git+https://github.com/$author/$pkgbase.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgbase}"

  # Install the program.
  install -Dm755 geolocate "${pkgdir}/usr/bin/geolocate"
}
