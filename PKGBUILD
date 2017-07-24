# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=openshot-git
pkgver=2.3.4.r3.gfe0f5f82
pkgrel=1
pkgdesc='An open-source, non-linear video editor for Linux based on MLT framework (git version)'
arch=('any')
url='http://www.openshot.org/'
license=('GPL3')
depends=('mlt-python-bindings' 'sdl' 'librsvg' 'mplayer'
         'pyxdg' 'python-pyqt5' 'python-httplib2' 'python-pillow' 'dvgrab'
         'ladspa' 'sox' 'vid.stab' 'qt5-svg' 'sdl_image'
         'libopenshot' 'python-pyzmq' 'qt5-webkit' 'python-setuptools'
         'python-requests')
makedepends=('git' 'python-setuptools')
optdepends=('frei0r-plugins: effects'
            'libquicktime' 'libavc1394' 'faac' 'jack' 'jack-rack')
provides=('openshot')
conflicts=('openshot')
source=("$pkgname"::'git+https://github.com/OpenShot/openshot-qt.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize='1'
}
