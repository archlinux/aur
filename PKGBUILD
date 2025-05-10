# Maintainer: Luke Short <ekultails@gmail.com>
pkgname=playtron-gamelab-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='GameLAB is part of the Playtron ecosystem and lets users configure games to get the best experience possible.'
url='https://www.playtron.one/contribute'
source_x86_64=("https://github.com/playtron-os/gamelab/releases/download/v${pkgver}/GameLAB_${pkgver}_amd64.deb")
arch=('x86_64')
license=('GPL-3.0')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('gamelab')
sha256sums_x86_64=('731cdb7ef8902265efab4b0d6316b095d077346e075645896a5152961e69403f')

package() {
  cd "$srcdir/"
  ar x GameLAB_${pkgver}_amd64.deb
  tar --extract --verbose --file data.tar.gz --directory "${pkgdir}"
  rm -f GameLAB_${pkgver}_amd64.deb control.tar.gz data.tar.gz debian-binary
}
