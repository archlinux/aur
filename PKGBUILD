pkgname=kazam
pkgver=1.4.5
pkgrel=1
pkgdesc="A screencasting program with design in mind"
arch=('any')
url="https://launchpad.net/kazam"
license=('GPL')
groups=()
depends=('python' 'python-cairo' 'python-xdg' 'python-dbus' 'python-distutils-extra'
    'python-gobject' 'gobject-introspection' 'gstreamer' 'gtk3' 'pango' 'gdk-pixbuf2'
    'libwnck3' 'ffmpeg' 'libmatroska' 'libtheora')
optdepends=('libkeybinder3: hotkeys support' 'libappindicator3: indicator on Unity panel support')
conflicts=('kazam-bzr' 'kazam-stable-bzr')
install=kazam.install
source=("https://launchpad.net/${pkgname}/stable/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
	'version.patch')
md5sums=('522ac80fef7123875271b30298ed6877'
         '36d5d6ed80729983ae77a060c3772b3a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/version.patch"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python3 setup.py install --root ${pkgdir}
}

md5sums=('522ac80fef7123875271b30298ed6877'
         '847ae2478ae5e35f6e1af49aa9fb3fa9')
