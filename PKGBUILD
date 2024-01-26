# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-readme-browser')
pkgver=0.1.0
pkgrel=1
pkgdesc="nwg-shell WebKitGTK-based README file browser"
arch=('any')
url="https://github.com/nwg-piotr/nwg-readme-browser"
license=('MIT')
provides=('nwg-readme-browser')
depends=('python' 'python-gobject' 'gtk3' 'webkit2gtk' 'gtk-layer-shell' 'python-markdown2' 'python-docutils')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-readme-browser/archive/v"$pkgver".tar.gz")

md5sums=('3fd50f0cda745f16feefb8c564e2b12b')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -t "$pkgdir"/usr/share/pixmaps nwg-readme-browser.svg
  install -D -t "$pkgdir"/usr/share/applications nwg-readme-browser.desktop
  install -D -t "$pkgdir"/usr/share/licenses LICENSE
  install -D -t "$pkgdir"/usr/share/doc README.md
}
