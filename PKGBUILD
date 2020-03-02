# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skycoin-font
pkgver=1
pkgrel=5
pkgdesc="Skycoin sans font. Skycoin.com"
url="https://skycoin.com"
arch=(any)
makedepends=('unzip' 'skycoin-keyring')
source=("https://downloads.skycoin.net/branding/Skycoin-Sans.zip"
"https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/master/key"
"PKGBUILD.sig")
sha256sums=('5f2a34270c4302d8c6a8b17676208d51698eb136fbff20080b1c7cfe552c908c'
'41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14'
'SKIP')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
                           '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>
prepare() {
	#gpg --import key
	#verify PKGBUILD signature
	gpg --verify ../PKGBUILD.sig ../PKGBUILD
}

package() {
  cd ${srcdir}
  install -d "${pkgdir}/usr/share/fonts/$pkgname"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/$pkgname"
}
