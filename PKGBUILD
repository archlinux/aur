#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=1.0.5
pkgrel=1
_pkgbase='errol-v1.0.5-83e8c2c40b270b6922bc1ddcb6ca0488ff281457'
_realname='errol'
pkgdesc="Errol is a file sender that rely on inotify. It can be used to watch a directory and automatically transfer the new files (or modified ones) with XMPP."
arch=(any)
url="https://blog.agayon.be/errol.html"
license=('GPLv3')
depends=('python' 'python-slixmpp' 'python-aionotify')
options=(!emptydirs)
provides=('python-errol')
#optdepends=('')

source=('https://gitlab.com/jnanar/errol/repository/v1.0.5/archive.tar.bz2')
sha512sums=('f012f73a8257d5ccaa196b6e3e0518286128e6710d71bbf3014fe6c377cf37dac5d70692be4dc60851aeae6a8c670f5a3f6fcf9287c777565962d514051b7638')


package() {
  cd $srcdir/$_pkgbase
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
