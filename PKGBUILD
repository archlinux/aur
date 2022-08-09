# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
pkgname=tomate-statusicon-plugin
pkgver=0.8.0
pkgrel=1
pkgdesc="Tomate plugin that shows the session progress in notification area"
arch=('any')
url="https://github.com/eliostvs/$pkname"
license=('GPL')
depends=('gtk-update-icon-cache'
         'gtk3'
         'hicolor-icon-theme'
         'python'
         'tomate-gtk')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/eliostvs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('32ae3fea0808d4e4e7ce62df466e9a99')
install=tomate-statusicon-plugin.install
conflicts=('tomate-indicator-plugin')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
