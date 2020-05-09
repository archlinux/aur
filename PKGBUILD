#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=2.0.0
pkgrel=1
_pkgbase='errol-v2.0.0'
_realname='errol'
pkgdesc="Errol is a file sender that rely on watchdog. It can be used to watch a directory and automatically transfer the new files (or modified ones) with XMPP."
arch=(any)
url="https://blog.agayon.be/errol.html"
license=('GPLv3')
depends=('python' 'python-slixmpp' 'python-watchdog')
options=(!emptydirs)
provides=('python-errol')

source=('https://gitlab.com/jnanar/errol/-/archive/v2.0.0/errol-v2.0.0.tar.gz')
sha512sums=('ec69332be83ba31baf52a695b86c8814decadce88ae46694a8b35d50114947a138e3e1648e15b71c0d0186dcb6fed19aefa919b4346e99136277a3b906803bf3')


package() {
  cd $srcdir/$_pkgbase
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
