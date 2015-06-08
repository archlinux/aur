# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=cb-pipemenus
pkgver=0.13
pkgrel=1
pkgdesc="various Openbox pipemenus"
arch=(any)
url="https://github.com/corenominal/cb-pipemenus"
depends=('openbox' 'zenity' 'terminator' 'wget' 'compton' 'curl' 'tar' 'python2-paramiko')
license=('custom')
source=(https://github.com/corenominal/cb-pipemenus/archive/master.zip)
sha256sums=('e2cfb418a35d4a5e62455c2beba02c3a312b9b2c7c2b1f8863c554e5a35b7474')

prepare() {
  cd "${pkgname}-master"
  sed -i 's/env python$/env python2/' cb-*
}

package() {
  cd "${pkgname}-master"
  for file in cb-*
  do
    install -D -m755 $file "${pkgdir}/usr/bin/${file}"
  done
}
