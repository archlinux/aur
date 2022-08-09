# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-indicator-plugin
pkgver=0.12.1
pkgrel=1
pkgdesc="Tomate plugin that shows the session progress in indicator"
arch=('any')
url="https://github.com/eliostvs/$pkgname"
license=('GPL')
depends=('gtk-update-icon-cache'
         'gtk3'
         'hicolor-icon-theme'
         'libappindicator-gtk3'
         'python'
         'tomate-gtk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('0837c52d2edc262e61e95f56c1cbf67c')
install=tomate-indicator-plugin.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
