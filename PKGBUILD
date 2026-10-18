# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Diego <cdprincipe@at@gmail@dot@com>
# Contributor: Scott Horowitz <stonecrest[at]gmail[dot]com>

pkgname=sonata
pkgver=1.7.4
pkgrel=1
pkgdesc='Elegant GTK+3 music client for MPD'
url='https://github.com/multani/sonata'
license=('GPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
depends=('python' 'python-gobject' 'gtk3' 'python-mpd2')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-tagpy: metadata editing support'
            'python-dbus: multimedia keys support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/multani/sonata/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('9bdeb1bbe03685ff324ad41652de096c70ad2dde227fb95fb0008e5579ceaf73')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer -d "${pkgdir}" dist/*.whl
}
