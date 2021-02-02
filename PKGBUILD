# Maintainer: Jamie Beardslee
# Emacs Application Framework written by Andy Stewart <lazycat.manatee@gmail.com>

pkgname="emacs-eaf"
pkgver=2.0.0
pkgrel=3
pkgdesc="EAF is a GUI application framework that revolutionizes Emacs graphical capabilities to ultimately Live in Emacs."
arch=('x86_64')
url="https://github.com/manateelazycat/emacs-application-framework"
license=('GPL3')
depends=('emacs' 'python-pyqt5' 'python-pyqt5-sip' 'python-pyqtwebengine' 'wmctrl' 'xdotool' 'nodejs')
optdepends=('python-pymupdf: EAF PDF Viewer support'
	        'python-qrcode: EAF File Sender/File Receiver/Airshare support'
	        'libreoffice: EAF Doc Viewer support'
	        'filebrowser-bin: EAF File Browser support'
            'python-qtconsole: EAF Jupyter support')
makedepends=('git')
provides=('emacs-eaf')
conflicts=('emacs-eaf')
source=("emacs-eaf::git+https://github.com/manateelazycat/emacs-application-framework")
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
