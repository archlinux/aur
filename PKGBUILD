# Maintainer: Mike Pento <mpento@darkforge.net>

pkgname=gtk-theme-equinox
pkgver=1.50
pkgrel=1
pkgdesc="Official themes for Equinox GTK engine."
url="https://launchpad.net/~tiheum/+archive/ubuntu/equinox"
license=('GPL2')
arch=('any')
depends=('gtk-engine-equinox')
optdepends=('faenza-icon-theme: icons designed for this theme'
            'lib32-gtk-engine-equinox: for 32 bits applications')

source=(https://launchpad.net/~tiheum/+archive/ubuntu/equinox/+sourcefiles/equinox-theme/$pkgver/equinox-theme_$pkgver.tar.gz)
sha256sums=('58e85d1a41824e1d6b12e122ee03ffaa27c913907d35ed38ee6e40c08c09fda0')

package() {
  cd ${srcdir}/equinox-theme-${pkgver}
  mkdir -pv "${pkgdir}/usr/share/themes"
  mv -v Equinox* ${pkgdir}/usr/share/themes/

  cd "${pkgdir}/usr/share/themes/"
  find -type f -name "gtkrc" -exec sed -i 's/#include/include/g' {} \;
  chown -R root:root "${pkgdir}/usr/share/themes"
}
