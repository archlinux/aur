# based on https://github.com/rbn42/panon/blob/master/PKGBUILD
# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>

_basename=panon
pkgname=plasma5-applet-${_basename}
pkgver=0.2.9
pkgrel=1
pkgdesc="A Different Audio Spectrum Analyzer"
arch=('any')
url="http://github.com/rbn42/panon"
license=('GPL3')
depends=('python-numpy' 'python-pillow' 'python-pyaudio' 'python-websockets' 'qt5-websockets' 'qt5-3d') 
makedepends=('git')
provides=('plasma5-applet-panon')
conflicts=('plasma5-applet-panon')
source=("${_basename}-${pkgver}::https://github.com/rbn42/${_basename}/archive/v${pkgver}.tar.gz")
md5sums=('e577bc7778a93da193d06e4c21fef33e')

package() {
  cd "${srcdir}/${_basename}-${pkgver}"
  #python setup.py install --root "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_basename%-*}/LICENSE"

  cd kde
  kpackagetool5 -p "$pkgdir/usr/share/plasma/plasmoids/" -t Plasma/Applet -i plasmoid
  rm "$pkgdir/usr/share/plasma/plasmoids/kpluginindex.json"
}

