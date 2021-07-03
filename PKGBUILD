# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>

pkgname=makedeb-beta
pkgver=5.4.0
pkgrel=1
pkgdesc="Create Debian archives from PKGBUILDs (beta release)"
arch=('any')
depends=('pacman' 'dpkg')
license=('GPL3')
url="https://github.com/hwittenborn/makedeb"

source=("https://proget.hunterwittenborn.com/debian-feeds/makedeb/main/makedeb-beta/all/makedeb-beta_all_${pkgver}-${pkgrel}.deb")
sha256sums=('SKIP')

package() {
  # Extract Debian package
  tar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"

  # Disable everything that uses APT
  sed -i 's|target_os=.*|target_os="arch"|' "${pkgdir}/usr/bin/makedeb"
  }
