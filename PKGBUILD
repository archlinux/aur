# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=cb-pipemenus
pkgver=0.13
pkgrel=1
pkgdesc="various Openbox pipemenus"
arch=(any)
url="https://github.com/TamCore/cb-pipemenus"
depends=('openbox' 'zenity' 'terminator' 'wget' 'compton' 'curl' 'tar' 'python2-paramiko')
license=('custom')
source=(https://github.com/TamCore/cb-pipemenus/archive/master.zip)
sha256sums=('885c9c149b821556d9b446cfccb49200523fc404e406d2c0aeb4b88e4b170016')

prepare() {
  cd "${pkgname}-master"
}

package() {
  cd "${pkgname}-master"
  for file in cb-*
  do
    install -D -m755 $file "${pkgdir}/usr/bin/${file}"
  done
}
