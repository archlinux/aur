# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname=stagit
pkgver=0.7.2
pkgrel=1
pkgdesc="static git page generator"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://git.2f30.org/stagit"
license=('custom:MIT/X Consortium')
source=("http://dl.2f30.org/releases/stagit-${pkgver}.tar.gz")
depends=('libgit2')
makedepends=('git')
sha256sums=('25facb7ce384f1d2f06c536753e2754b38037b482c6a546196ebebf4c34b7ad4')

build() {
  cd "stagit-${pkgver}"
  make
}

package() {
  cd "stagit-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
