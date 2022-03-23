# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

_name='Beekeeper Studio'
_pkgname='beekeeper-studio'
pkgname="${_pkgname}-bin"
pkgver=3.2.1
pkgrel=1
pkgdesc='Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more'
arch=('x86_64' 'aarch64')
url='https://www.beekeeperstudio.io'
_url_source='https://github.com/beekeeper-studio/beekeeper-studio'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxslt' 'nodejs' 'nss' 'xdg-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}-license::${_url_source}/raw/v${pkgver}/LICENSE.md")
source_x86_64=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_url_source}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('1409fbbc5265c85da91684660c87f85d74c3fdc63a2d355169f40dac5cc7a078')
sha256sums_x86_64=('6a0a3e0fedd2e369fc922dd248b975d79624017f4c56a7e666cbc937a367e257')
sha256sums_aarch64=('2d3c69944468f11696c26d60149628c36452079a97d41e0703202c7d90bc6a48')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  rm -rf "${pkgdir}/usr/share/doc"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/${_name}/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/${_name}/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dvm644 "${_pkgname}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
