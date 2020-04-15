# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skyimager
pkgname1=skyimager-gui
projectname=skycoin
pkgdesc="Skywire Node microSD / TFcard setup utility. skycoin.com"
pkgver=0.0.1
pkgrel=1
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=()
depends=()
source=("https://github.com/Skyfleet/sky-update/releases/download/${pkgname}/${pkgname}-linux-amd64-v${pkgver}-2.tar.xz")
sha256sums=('68e35897495b307d1c6c75fe9adf071213943122d197b38a1f9206d1d4efc99e')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
              '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>
prepare() {
  #gpg --import key
  #verify PKGBUILD signature
  gpg --verify ../PKGBUILD.sig ../PKGBUILD
  #Skyflash_Skyflash-v0.0.6_linux_amd64'
}

package() {
  msg2 'installing files'
  install -Dm755 ${srcdir}/linux-amd64/${pkgname1} ${pkgdir}/usr/bin/${pkgname1}
  ln -rTsf ${pkgdir}/usr/bin/${pkgname1} ${pkgdir}/usr/bin/${pkgname}
}
