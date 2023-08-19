# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-statusicon-plugin
pkgver=0.8.1
pkgrel=2
pkgdesc="Tomate plugin that displays the progress of the session in the system tray"
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
md5sums=('b07494861f528ab6d321981a58556526')
install=tomate-statusicon-plugin.install
conflicts=('tomate-indicator-plugin')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
