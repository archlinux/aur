# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=weboob
pkgname=weboob-headless
pkgver=1.3
pkgrel=1
pkgdesc="Web Out Of Browsers provides several applications to interact with a lot of websites. Headless version, for use in e.g. Cozy/Kresus."
arch=('any')
url="http://weboob.org/"
license=('GPL')
depends=('python2-dateutil'
         'python2-feedparser'
         'python2-lxml'
         'python2-prettytable'
         'python2-requests'
#         'python2-cssselect'
#         'python2-html2text'
         'python2-pillow'
         'python2-simplejson'
         'python2-yaml'
         'python2-mechanize'
         'python2-gdata'
         'python2-futures')
makedepends=('python2-setuptools')
conflicts=('weboob')
provides=('weboob')
source=("https://symlink.me/attachments/download/356/${_pkgname}-${pkgver}.tar.gz")
md5sums=('becbb39232ca9b8f425d81c04b90b9ed')
sha256sums=('c991785c889877c76f18d19e372ed4ae0c3f8b819fd1e8da296bd34b1381be54')

build() {
    cd ${_pkgname}-${pkgver}
    python2 setup.py build --no-qt --no-hildon
}

package() {
    cd ${_pkgname}-${pkgver}
    python2 setup.py install --no-xdg --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
