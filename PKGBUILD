# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>

pkgname=makedeb-alpha
pkgver=5.8.4
pkgrel=1
pkgdesc="Create Debian archives from PKGBUILDs (alpha release)"
arch=('any')
depends=('pacman' 'dpkg')
license=('GPL3')
url="https://github.com/hwittenborn/makedeb"

source=("https://proget.hunterwittenborn.com/debian-feeds/makedeb/main/makedeb-alpha/all/makedeb-alpha_all_${pkgver}-${pkgrel}.deb")
sha256sums=('SKIP')

package() {
  # Extract Debian package
  tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"

  # Disable everything that uses APT
  sed -i 's|target_os=.*|target_os="arch"|' "${pkgdir}/usr/bin/makedeb"
  }
