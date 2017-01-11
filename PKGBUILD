Maintainer='Gilles Hamel <hamelg@laposte.net>'
pkgname=weboob
pkgver=1.2
pkgrel=2
pkgdesc="Web Out Of Browsers provides several applications to interact with a lot of websites."
arch=('any')
url="http://weboob.org/"
license=('GPL')
install='weboob.install'
depends=('python2-pyqt5' 'phonon-qt5' 'python2-dateutil' 'python2-prettytable'
	 'python2-requests' 'python2-google-api-python-client'
         'python2-feedparser' 'python2-cssselect' 'python2-html2text'
         'python2-imaging' 'python2-mechanize' 'python2-simplejson'
         'python2-lxml' 'python2-yaml' 'python2-futures'
	 'which')
makedepends=('python2-setuptools')
optdepends=('gnupg: check for repository authenticity'
            'python2-routes: contrib backends'
            'python2-webob: contrib backends'
            'python2-mako: contrib backends'
            'pywebkitgtk: contrib backends'
            'python2-pysqlite: contrib backends'
            'python2-pillow: PIL replacement'
            'python2-termcolor: color formatting'
            'python2-nose: test suite'
	    'bash-completion: to enable bash completion')
source=("https://symlink.me/attachments/download/342/$pkgname-$pkgver.tar.gz")
md5sums=('a77675b2443e4570d30f569951512b11')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --qt --xdg --prefix=/usr --root="$pkgdir"
  install -Dm 644 tools/weboob_bash_completion \
  	  "$pkgdir/etc/bash_completion.d/weboob"
}
