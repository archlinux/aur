# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-gtk
pkgver=0.9.0
pkgrel=1
pkgdesc="A timer for the Pomodoro Technique"
arch=('any')
url="https://github.com/eliostvs/tomate-gtk"
license=('GPL')
depends=('desktop-file-utils'
         'gtk-update-icon-cache'
         'gtk3'
         'hicolor-icon-theme'
         'python'
         'python-tomate')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('f0ecc6ee074024819666088682e4387a')
install=tomate-gtk.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
