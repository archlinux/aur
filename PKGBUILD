# Maintainer: Thiago França da Silva <tfsthiagobr98@outlook.com>

pkgname=powershell-preview-bin
_pkgver=6.1.0-rc.1
_version=6-preview
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (binary preview package)'
arch=('x86_64')
url='https://github.com/Powershell/Powershell'
depends=()
provides=('powershell')
options=(staticlibs !strip)
install=powershell-preview.install
sha256sums=('304910fb2445b9a6bda4a116962dcfb8bb276385a7cb973090e39ad08e0ac423')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell-preview_${pkgver}-1.ubuntu.18.04_amd64.deb")

package() {
  bsdtar xf data.tar.gz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  cp -r usr/local/share usr
  rm -rf usr/local

  chmod 755 opt/microsoft/powershell/$_version/pwsh
}
