# Maintainer: Elrondo46 <elrond94athotmaildotcom>

# Special package for a discord friend Sipomatador ducosmos but now build for all

pkgname=inkscape-silhouette-git
pkgver=1.19.r28.g3c28053
pkgrel=1
pkgdesc="Inkscape driver for silhouette device"
arch=('any')
url="https://github.com/fablabnbg/inkscape-silhouette.git"
license=('GPL3')
depends=('python2-setuptools' 'inkscape' 'python2' 'python2-lxml' 'python2-pyusb')
source=("git://github.com/fablabnbg/inkscape-silhouette.git")
sha256sums=('SKIP')

pkgver() {
  cd "inkscape-silhouette"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "inkscape-silhouette"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir"/usr/share/inkscape/extensions/
  cp "$srcdir"/inkscape-silhouette/sendto_silhouette.* "$pkgdir"/usr/share/inkscape/extensions/
  cp -R "$srcdir"/inkscape-silhouette/silhouette "$pkgdir"/usr/share/inkscape/extensions/
}


