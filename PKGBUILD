# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=gtk2fontsel
pkgver=0.1
pkgrel=7
pkgdesc="Font selection and preview tool"
arch=('x86_64')
url="http://gtk2fontsel.sourceforge.net/"
license=('GPL')
depends=('gtk2')
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz gtk2fontsel.desktop)
sha512sums=('5854777853bd41da7465321bf0f73062b98979bbecc727c3a611aa193e4d436d388fea9492b8bb11f26fa97cd4a7716c34b6a621c0a6448708ca207493998294'
            '201eb71a75529e49b22f3b5c003355925e54ddbee7b602bc712806412ec44099eeff4152026869caf225955598c49e9c74ef96044ec50db70fb740160440eb95')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  make prefix=${pkgdir}/usr install
  install -D -m644 ${srcdir}/gtk2fontsel.desktop \
    ${pkgdir}/usr/share/applications/gtk2fontsel.desktop
}
