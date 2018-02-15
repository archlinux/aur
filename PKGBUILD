# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Miguel Useche <migueluseche(dot)skatox.com>

pkgname=turpial
pkgname_=Turpial
pkgver=3.0
pkgrel=1
pkgdesc="A multi-interface Twitter client written in Python."
arch=(any)
url="http://turpial.org.ve/"
license=('GPL3')
depends=('python2' 'libturpial>=0.8' 'python2-distribute' 'python2-simplejson>=1.9.2' 'python2-notify2>=0.1.1' 'notification-daemon' 'gstreamer0.10-python' 'python2-babel>=0.9.1' 'pywebkitgtk')
optdepends=(
    'pygtk>=2.12: GTK user interface'
    'aspell: GTK user interface'
    'gnome-spell: GTK user interface'
    'python2-gtkspell>=2.25.3: GTK user interface'
    'python2-pyqt4>=2.12: Qt user interface'
    'python2-jinja>=2.6: Qt user interface'
)
# TODO is it really correct that pywebkitgtk is required but the GTK UI is optional?
conflicts=(${pkgname}-git)
source=(https://github.com/satanas/$pkgname_/archive/$pkgver.tar.gz)
sha256sums=('af13a168f1f109a06f4edfd6426c50eaf8d10105031b8d27355e97b0dab500d9')

build() {
    cd "$srcdir/$pkgname_-$pkgver"
    python2 setup.py build || return 1
}

package() {
    cd "$srcdir/$pkgname_-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1 || return 1
}
