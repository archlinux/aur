# Original PKGBUILD Author: Bruno Jacquet <maxijac@free.fr>
# Maintainer: CelestialWalrus <aur@celestial.cf>
pkgname=rgain
pkgver=1.3.3
_dirname='fk-'$pkgname'-ee516a7bec19'
pkgrel=1
pkgdesc="Modules to read, write and calculate Replay Gain"
arch=('any')
url="https://bitbucket.org/fk/rgain"
license=('GPL')
groups=()
#Actually we get a traceback when gst-plugins-good is not installed
depends=('python2' 'mutagen' 'gstreamer' 'pygobject2-devel' 'gst-plugins-good')
makedepends=('python2-docutils')
optdepends=('gst-plugins-bad' 'gst-plugins-ugly')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://bitbucket.org/fk/rgain/get/'${pkgver}'.tar.bz2')
md5sums=('8ab585c0d0051cc86675d86750b3f8a6')

package() {
  cd "$srcdir/$_dirname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 build/man/collectiongain.1 "${pkgdir}/usr/share/man/man1/"
  install -m644 build/man/replaygain.1 "${pkgdir}/usr/share/man/man1/"
}
