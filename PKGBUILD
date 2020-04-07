# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=devtools-git
pkgver=20200407
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://git.archlinux.org/devtools.git/'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('asciidoc' 'git')
optdepends=('btrfs-progs: btrfs support')
provides=('devtools')
conflicts=('devtools')
source=("git+https://git.archlinux.org/devtools.git?signed")
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'
              '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'
              '86CFFCA918CF3AF47147588051E8B148A9999C34'
              '8FC15A064950A99DD1BD14DD39E4B877E62EB915'
              '8218F88849AAC522E94CF470A5E9288C4FA415FA'
              'B81B051F2D7FC867AAFF35A58DBD63B82072D77A'
              'F3691687D867B81B51CE07D9BBE43771487328A9'
              '6645B0A8C7005E78DB1D7864F99FFE0FEAE999BD'
              'E240B57E2C4630BA768E2F26FC1B547C8D8172C8')
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname/-git/}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname/-git/}
  make PREFIX=/usr
}

package() {
  cd ${pkgname/-git/}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
