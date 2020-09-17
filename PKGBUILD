#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=2.0.3
pkgrel=1
_realname='errol'
pkgdesc="Errol is a file sender that rely on watchdog. It can be used to watch a directory and automatically transfer the new files (or modified ones) with XMPP."
arch=(any)
url="https://blog.agayon.be/errol.html"
license=('GPLv3')
depends=('python' 'python-slixmpp' 'python-watchdog' 'python-hachiko')
options=(!emptydirs)
provides=('python-errol')

source=("https://gitlab.com/jnanar/${_realname}/-/archive/v${pkgver}/errol-v${pkgver}.tar.bz2")
sha512sums=('e045d5a266642b86786c4e6d5bf69e1c8152895ffa9200f7da31f33f85343582c946f501d6b8b37f3c25fb7960758fca4b4f80dbd06735ebb61b9552f167c4f8')


package() {
  cd $srcdir/$_realname-v$pkgver
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
