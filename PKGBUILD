# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: Scott Horowitz <stonecrest[at]gmail[dot]com>

pkgname=sonata
pkgver=1.7.0
pkgrel=1
pkgdesc='Elegant GTK+3 music client for MPD'
url='https://github.com/multani/sonata'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python' 'python-gobject' 'gtk3' 'python-mpd2')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-tagpy: metadata editing support'
            'python-dbus: multimedia keys support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/multani/sonata/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('564a226f8d57b286836742d234aa9fa8bc47b897a4f1d61f99a544777c5aab1e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build -wn
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer -d "${pkgdir}" dist/*.whl
}
