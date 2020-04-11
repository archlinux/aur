# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skyflash-bin
pkgname1=skyflash
projectname=skycoin
githuborg=skycoinproject
pkgdesc="Skywire Node microSD / TFcard setup utility. skycoin.com"
pkgver=0.0.6
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=1
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=(gzip)
depends=()
source=("https://github.com/Skyfleet/sky-update/releases/download/skyimager/skyimager-linux-amd64-v0.1.0-2.tar.xz")
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
  install -Dm755 ${srcdir}/linux-amd64/skyimager-gui ${pkgdir}/usr/bin/skyimager-gui
  ln -rTsf ${pkgdir}/usr/bin/skyimager-gui ${pkgdir}/usr/bin/skyflash-gui
  chmod 755 ${pkgdir}/usr/bin/skyimager-gui
}
