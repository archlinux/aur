# Maintainer: Bouteiller a2n Alan <a2n.dev@pm.me>
pkgname=postier-bin
appname=postier
pkgver=2.1.2
pkgrel=3
pkgdesc="API client without bloat"
arch=('x86_64')
url="https://github.com/results-may-vary-org/postier"
license=('GPL')
depends=('glibc' 'gtk3' 'webkit2gtk-4.1' 'desktop-file-utils' 'hicolor-icon-theme')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v"${pkgver}"/"${appname}"_"${pkgver}"_amd64-webkit2_41.deb")
sha256sums_x86_64=('f7af64db577341a594969349a9bae2e5f08ebd8137794cff891767ced29acae0')
package() {
  # Extract the deb package
  ar x "${appname}_${pkgver}_amd64-webkit2_41.deb"

  # Extract package data
  tar -xz -f data.tar.gz -C "${pkgdir}"

  # Fix permissions
  chmod 755 "${pkgdir}/usr/bin/postier"
}
