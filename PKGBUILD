# Maintainer: Jamie Beardslee
# Emacs Application Framework written by Andy Stewart <lazycat.manatee@gmail.com>

pkgname="emacs-eaf"
pkgver=1.0.0
pkgrel=2
pkgdesc="EAF extends GNU Emacs to an entire universe of powerful GUI applications."
arch=('x86_64')
url="https://github.com/manateelazycat/emacs-application-framework"
license=('GPL3')
depends=('emacs' 'python-dbus' 'python-xlib' 'python-qtpy' 'python-pyqtwebengine' 'python-qrcode' 'python-feedparser' 'python-pymupdf' 'python-grip' 'python-pydbus')
makedepends=('git')
provides=('emacs-eaf')
conflicts=('emacs-eaf')
source=("emacs-eaf::git://github.com/manateelazycat/emacs-application-framework")
options=(!strip)
md5sums=('SKIP')

package() {
    cd "$srcdir/emacs-eaf"

    mkdir -p "$pkgdir"/usr/share/emacs/site-lisp/eaf/
    for _i in app core docker *.el *.py
    do
	cp -r ${_i} "$pkgdir"/usr/share/emacs/site-lisp/eaf/
    done
    
    mkdir -p "$pkgdir"/usr/share/doc/emacs-eaf/
    cp README.md "$pkgdir"/usr/share/doc/emacs-eaf/README.md

}
