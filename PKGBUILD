#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=2.0.0
pkgrel=2
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
sha512sums=('0d355fe66093357fc27d944e5f1b7e36d08fd2812f5bc50c6f4fe48536f77d079037a5f072c563ad79f91859685dbeeca90b1951d062fb8219aae4aa762ea827')


package() {
  cd $srcdir/$_pkgbase
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
