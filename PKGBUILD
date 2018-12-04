# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=openshot-git
_srcname=openshot-qt
pkgver=2.4.3.r83.gc9a0a8a9
pkgrel=1
pkgdesc='An open-source, non-linear video editor for Linux based on MLT framework (git version)'
arch=('any')
url='https://www.openshot.org/'
license=('GPL3')
depends=('mlt-python-bindings' 'sdl' 'librsvg' 'mplayer'
         'pyxdg' 'python-pyqt5' 'python-httplib2' 'python-pillow' 'dvgrab'
         'ladspa' 'sox' 'vid.stab' 'qt5-svg' 'sdl_image'
         'libopenshot-git' 'python-pyzmq' 'qt5-webkit' 'python-setuptools'
         'python-requests')
makedepends=('git' 'python-setuptools')
optdepends=('frei0r-plugins: effects'
            'libquicktime' 'libavc1394' 'faac' 'jack')
provides=('openshot')
conflicts=('openshot')
source=('git+https://github.com/OpenShot/openshot-qt.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd "$_srcname"
    
    python setup.py install --root="$pkgdir" --optimize='1'
}
