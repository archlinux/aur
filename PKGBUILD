# Maintainer: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_commit=39
_hash="5632fde618845dba5c22f14adc7b52bf6c52d46d"
_pkgbase=xkcd-font
pkgname=('otf-xkcd-font' 'ttf-xkcd-script-font')
pkgver="r${_commit}.${_hash::7}"
pkgrel=2
pkgdesc="The xkcd font."
arch=(any)
url="https://github.com/ipython/xkcd-font"
license=('CCPL:cc-by-nc-3.0')
source=("$_pkgbase-$pkgver.zip::https://github.com/ipython/xkcd-font/archive/${_hash}.zip")
sha256sums=('8d58ee790c9aa35ea7937443cb304ce9f8b663b9628a91c13a5a4b163772b904')

package_otf-xkcd-font() {
  cd "${srcdir}/${_pkgbase}-${_hash}"
  install -Dm644 xkcd/build/xkcd.otf -t "$pkgdir/usr/share/fonts/OTF"
}

package_ttf-xkcd-script-font() {
  cd "${srcdir}/${_pkgbase}-${_hash}"
  install -Dm644 xkcd-script/font/xkcd-script.ttf -t "$pkgdir/usr/share/fonts/TTF"
}
