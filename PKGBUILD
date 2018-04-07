# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: John W. Trengrove <john@retrofilter.com>

pkgname=stagit
pkgver=0.8
pkgrel=1
pkgdesc="static git page generator"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://git.codemadness.org/stagit"
license=('custom:MIT/X Consortium')
source=("https://codemadness.org/releases/stagit/stagit-${pkgver}.tar.gz")
depends=('libgit2')
makedepends=('git')
sha256sums=('641bc8f6cd7e1a10ec8643f9073f76b4e3aef108f83e85f67ee49618c1048d7e')

build() {
  cd "stagit-${pkgver}"
  make
}

package() {
  cd "stagit-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
