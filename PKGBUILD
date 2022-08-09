# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-statusnotifieritem-plugin
pkgver=0.1.2
pkgrel=1
pkgdesc="Tomate plugin that shows the session progress on the tray icon area"
arch=('any')
url="https://github.com/eliostvs/$pkgname"
license=('GPL')
depends=('gtk-update-icon-cache'
         'gtk3'
         'hicolor-icon-theme'
         'python'
         'tomate-gtk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e7da1e01d6a97e91bb918496d6cde0245f26159767905a1faae620cf9b763a5b')
install=tomate-statusnotifieritem-plugin.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
