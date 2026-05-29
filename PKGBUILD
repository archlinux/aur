# Maintainer: Arnav Gupta <allenarnav2023@gmail.com>
pkgname=soundkeeper-linux
pkgver=1.0.0
pkgrel=1
pkgdesc="Keeps audio devices alive by playing an inaudible 19kHz tone via SoX."
arch=('any')
url="https://github.com/arnav4o4/soundkeeper-linux"
license=('MIT')
depends=('sox')

# This now maps cleanly to .../tags/v1.0.0.tar.gz
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2146ea5c27f7ba0e44a15aaffdd109056a06708aaa6617bc7293d883d193fa45')

package() {
  # Step into the correct directory extracted from the v1.0.0 tarball
  cd "${pkgname}-${pkgver}"

  # Install the systemd user service
  install -Dm644 "soundkeeper.service" "${pkgdir}/usr/lib/systemd/user/soundkeeper.service"
}
