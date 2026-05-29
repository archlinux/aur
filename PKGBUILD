# Maintainer: Arnav Gupta <allenarnav2023@gmail.com>
pkgname=soundkeeper-linux
pkgver=1.0
pkgrel=2  # Incremented to 2 for the update
pkgdesc="Keeps audio devices alive by playing an inaudible 19kHz tone via SoX."
arch=('any')
url="https://github.com/arnav4o4/soundkeeper-linux"
license=('MIT')
depends=('sox')

# Points to your GitHub release tarball instead of a local file
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP') # We will overwrite this with 'updpkgsums'

package() {
  # Step into the directory extracted from the GitHub archive
  cd "${pkgname}-${pkgver}"

  # Install the systemd user service
  install -Dm644 "soundkeeper.service" "${pkgdir}/usr/lib/systemd/user/soundkeeper.service"
}
