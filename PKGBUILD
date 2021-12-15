# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=devtools32
pkgver=20200629
pkgrel=2
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://github.com/archlinux32/devtools32'
depends=('bash' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
	 'git' 'bzr' 'mercurial' 'diffutils' 'util-linux' 'awk')
makedepends=('asciidoc' 'git')
optdepends=('btrfs-progs: btrfs support')
source=("$pkgname::git+https://git.archlinux32.org/devtools32#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  cd ${pkgname}
  make BUILDTOOLVER="${pkgver}-${pkgrel}-${arch}" PREFIX=/usr
}

package() {
  cd ${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
