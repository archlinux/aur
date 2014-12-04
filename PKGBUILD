# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=neonview
pkgver=0.8.2
pkgrel=1
pkgdesc='Free, lightweight image viewer'
arch=('i686' 'x86_64')
url='http://www.tuxarena.com/intro/neonview.php'
license=('GPL')
depends=('desktop-file-utils' 'gtk3')
install=$pkgname.install
source=(http://www.tuxarena.com/intro/files/${pkgname}-${pkgver}-src.tar.gz
        $pkgname.desktop)
sha256sums=('f48fb09dabeb1ab1c348e5409d3cf84a4054f0838c5b2f2dabccc9115f114e46'
            'b858e4e69883f1f675de69bdb22c271976ca64b5bf77a9f746629fada4a97ab8')

build() {
  cd ${pkgname}-${pkgver}-src

  make
}

package() {
  cd ${pkgname}-${pkgver}-src

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname

#.desktop file
  install -Dm644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
