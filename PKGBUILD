# Maintainer: Thiago França da Silva <tfsthiagobr98@outlook.com>

pkgname=powershell-preview-bin
_pkgver=7.0.0-rc.2
_version=7-preview
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (binary preview package)'
arch=('x86_64')
url='https://github.com/Powershell/Powershell'
depends=('libunwind' 'icu' 'openssl-1.0')
provides=('powershell')
options=(staticlibs !strip)
install=powershell-preview.install
sha256sums=('F2599307D4AE082BEAD3F8457C48DF1FBC5A9378744F3C437F1CCE1D15BA7090')
source=("https://github.com/PowerShell/PowerShell/releases/download/v${_pkgver}/powershell-preview_${_pkgver}-1.ubuntu.18.04_amd64.deb")

package() {
  bsdtar xf data.tar.gz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  cd "${pkgdir}"
  cp -r usr/local/share usr
  rm -rf usr/local

  chmod 755 opt/microsoft/powershell/$_version/pwsh
}
