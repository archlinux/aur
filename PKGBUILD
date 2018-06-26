# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=polo-donation-plugins
_channel=beta.10
pkgver=18.2
pkgrel=4
pkgdesc="Complimentary package for users who have donated to Polo or contributed in other ways such as translations, code changes, etc."
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/polo/wiki/Donation-Features"
depends=('polo')
optdepednds=(
         'ghostscript: for PDF plugin'
         'pdftk: for PDF plugin'
         'pdftk-bin: for PDF plugin'
         'pngcrush: for Image plugin'
         'qemu: for ISO plugin'
         'samba: for ISO plugin (kvm -smb)'
         'youtube-dl: for Video download plugin'
)
provides=('polo-donations-plugins')
conflicts=('polo-donations-plugins')
source_i686=("local://${pkgname}-v${pkgver}-i386.deb") 
source_x86_64=("local://${pkgname}-v${pkgver}-amd64.deb") 
md5sums_i686=('648e3e55a3c8fc5f02559814683ce461')
md5sums_x86_64=('f471ffeace0aa90368e68f8fbdcb9684')

package() {

  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -d "${pkgdir}/usr/bin"

if [[ "${CARCH}" = 'i686' ]]; then
      ln -s /usr/bin/qemu-system-i686 ${pkgdir}/usr/bin/kvm
    fi
if [[ "${CARCH}" = 'x86_64' ]]; then
      ln -s /usr/bin/qemu-system-x86_64 ${pkgdir}/usr/bin/kvm
    fi
}
