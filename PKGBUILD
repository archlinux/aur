# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=fusion-icon
epoch=1
pkgver=0.2.3
pkgrel=2
pkgdesc="Simple tray icon for Compiz 0.8"
arch=('any')
url="http://www.compiz.org/"
license=('GPL')
conflicts=('fusion-icon0.9')
depends=('compizconfig-python' 'hicolor-icon-theme' 'xorg-utils' 'mesa-demos')

# Note to anyone who builds this: Make sure you install the appropriate
# dependencies for the user interfaces you want to use! Otherwise, it'll appear
# like it's not working!
# Also - change these to python2 if you're using Compiz 0.9.x
optdepends=(
	'python-pyqt5: For the Qt Interface'
	'python-gobject: For the GTK+ Interface'
	'libappindicator-gtk3: For the GTK+ Interface'
)

install="$pkgname.install"
source=("https://github.com/compiz-reloaded/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Change this line to use python2 if you're using Compiz 0.9.x
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Change this line to use python2 if you're using Compiz 0.9.x
  python setup.py install --root="${pkgdir}" --optimize=1
}

sha256sums=('6b609b4b6c8b81175ddafae4aa7b3d905938443dbb1db10523e428b6aba0d521')
