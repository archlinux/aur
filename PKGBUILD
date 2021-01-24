# Maintainer: João Figueiredo <jf.mundox@gmail.com> (11/07/2020)
# Contributor: freggel.doe (Fixed i18n problem with make test,  13/07/2020)
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: Bram Schoenmakers <me@bramschoenmakers.nl>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: rakoo (AUR)
# Contributor: SanskritFritz (gmail)

pkgname=bup
pkgver=0.32
pkgrel=1
pkgdesc='Efficient backup system based on the git packfile format'
arch=('x86_64')
url='https://bup.github.io/'
license=('GPL')
depends=('python-fuse' 'par2cmdline' 'python-pyxattr' 'acl' 'readline' 'attr' 'git')
optdepends=('python-tornado: for bup web')
makedepends=('pandoc')
#checkdepends=('rsync' 'python-tornado')
conflicts=('bup-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bup/bup/archive/${pkgver}.tar.gz")
sha256sums=('a894cfa96c44b9ef48003b2c2104dc5fa6361dd2f4d519261a93178984a51259')
changelog=changelog.md

build() {
  cd "$pkgname-$pkgver"
  ./configure
  make
}

#check() {
#  cd "$pkgname-$pkgver"
#  LANG=C make test
#}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
