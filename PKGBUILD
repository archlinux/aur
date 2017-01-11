# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>

_pkgname=weboob
pkgname=weboob-headless
pkgver=1.2
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
source=("https://symlink.me/attachments/download/342/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a77675b2443e4570d30f569951512b11')
sha256sums=('1e3b7e35bd1e5d203e5d716be4a25e898aba6887b3c3b8341e3a0ce2ad8e87b0')

build() {
    cd ${_pkgname}-${pkgver}
    python2 setup.py build --no-qt --no-hildon
}

package() {
    cd ${_pkgname}-${pkgver}
    python2 setup.py install --no-xdg --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
