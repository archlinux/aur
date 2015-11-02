# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Miguel Useche <migueluseche(dot)skatox.com>

pkgname=turpial
pkgver=3.0
pkgrel=1
pkgdesc="A multi-interface Twitter client written in Python."
arch=(any)
url="http://turpial.org.ve/"
license=('GPL3')
depends=('python2' 'libturpial>=0.8' 'python2-distribute' 'python2-simplejson>=1.9.2' 'pygtk>=2.12' 'python2-notify2>=0.1.1' 'notification-daemon' 'gstreamer0.10-python' 'python2-babel>=0.9.1' 'pywebkitgtk')
optdepends=('python2-gtkspell>=2.25.3' 'gnome-spell' 'aspell')
conflicts=(${pkgname}-git)
source=(http://files.turpial.org.ve/sources/stable/$pkgname-$pkgver.tar.gz)
sha1sums=('f47af9b7e4ffbf5b2dcd7ed4d81fd55a212b072c') # ${source[0]}.sha1sum

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py build || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1 || return 1
}
