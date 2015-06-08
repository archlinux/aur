# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=cb-pipemenus-git
pkgver=0.13
pkgrel=1
pkgdesc="various Openbox pipemenus"
arch=(any)
url="https://github.com/TamCore/cb-pipemenus"
depends=('openbox' 'zenity' 'terminator')
provides=('cb-pipemenus')
replaces=('cb-pipemenus')
conflicts=('cb-pipemenus')
optdepends=(
    'python2-paramiko: for cb-sshconfig-pipemenu'
    'mesa-demos: for cb-compositor'
    'gksu: for cb-printing-pipemenu'
    'compton: for cb-compton'
    'wget: for cb-dropbox-pipemenu'
    'curl: for cb-dropbox-pipemenu'
    'tar: for cb-dropbox-pipemenu'
)
license=('custom')
source=(git://github.com/TamCore/cb-pipemenus.git)
sha256sums=('SKIP')

package() {
  cd "${pkgname%-git}"
  for file in cb-*
  do
    install -D -m755 $file "${pkgdir}/usr/bin/${file}"
  done
}
