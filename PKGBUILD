# based on https://github.com/rbn42/panon/blob/master/PKGBUILD
# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>
# Contributor: Robin <rbn dot 86 et bigbrothergoogle>
# Contributor: Philipp A. <flying-sheep@github.com>

_basename=panon
pkgname=plasma5-applets-${_basename}
pkgver=0.2.16
pkgrel=1
pkgdesc="A Different Audio Spectrum Analyzer for KDE Plasma"
arch=('any')
url="http://github.com/rbn42/panon"
license=('GPL3')
depends=('plasma-workspace' 'python-docopt' 'python-numpy' 'python-pillow' 'python-pyaudio' 'python-websockets' 'qt5-websockets' 'qt5-3d') 
makedepends=('git')
provides=('plasma5-applets-panon')
conflicts=('plasma5-applets-panon')
source=("${_basename}-${pkgver}::https://github.com/rbn42/${_basename}/archive/v${pkgver}.tar.gz")
md5sums=('d83f76232ed8a7faaf272a2d4baad72b')

package() {
  cd "${srcdir}/${_basename}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_basename%-*}/LICENSE"

  cd kde
  kpackagetool5 -p "$pkgdir/usr/share/plasma/plasmoids/" -t Plasma/Applet -i plasmoid
}

