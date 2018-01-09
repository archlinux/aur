#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=1.0.6
pkgrel=1
_pkgbase='errol-v1.0.6-695058bb38843079298d22105b10baa2f7bd30ae'
_realname='errol'
pkgdesc="Errol is a file sender that rely on inotify. It can be used to watch a directory and automatically transfer the new files (or modified ones) with XMPP."
arch=(any)
url="https://blog.agayon.be/errol.html"
license=('GPLv3')
depends=('python' 'python-slixmpp' 'python-aionotify')
options=(!emptydirs)
provides=('python-errol')
#optdepends=('')

source=('https://gitlab.com/jnanar/errol/repository/v1.0.6/archive.tar.bz2')
sha512sums=('06a15238f9f85daf1e723eeaa2ac43887a0228adf1d972e83175393d581ec4365fcfddf67349c280e0e4aa942037b17666694165ca55931f5998d14550a7687e')


package() {
  cd $srcdir/$_pkgbase
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
