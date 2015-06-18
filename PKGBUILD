# Maintener: sputnick <gilles *DOT* quenot *AT* gmail *DOT* com>
# Contributor: ianux <ianux@free.fr>

pkgname=weboob-git
pkgver=1.0-652-g40246c8
pkgrel=1
pkgdesc="Weboob (Web Out Of Browsers) provides several applications to interact with a lot of websites."
url="http://weboob.org"
license=('GPL3')
arch=('i686' 'x86_64')
depends=(
    phonon-qt4
    python2-cssselect
    python2-dateutil
    python2-elementtidy
    python2-feedparser
    python2-gdata
    python2-html2text
    python2-imaging
    python2-lxml
    python2-mechanize
    python2-prettytable
    python2-pyqt
    python2-pysqlite
    python2-requests
    python2-simplejson
    python2-yaml
    which
)
makedepends=(git python2-distribute setuptools)
optdepends=('gnupg: check for repository authenticity'
            'python2-routes: contrib backends'
            'python2-webob: contrib backends'
            'python2-mako: contrib backends'
            'pywebkitgtk: contrib backends'
            'python2-pillow: PIL replacement'
            'python2-termcolor: color formatting'
            'python2-nose: test suite')
conflicts=('weboob')
provides=('weboob')
source=("$pkgname"::'git://git.symlink.me/pub/weboob/devel.git')
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    local ver="$(git describe --long)"
    printf "%s" "${ver//-/.}"
}

package() {
   cd ${srcdir}/${pkgname}
   python2 setup.py install --qt --xdg --prefix=/usr --root="$pkgdir"
}

