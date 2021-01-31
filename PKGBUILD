#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=2.0.4
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
sha512sums=('f04c6120219b8629abcf6751153d1b5046a9406e4ea55a99375ec76957d9500542f6ac3ba36dea10e8179665c7d44cd83d4acabfa9512fe5f5d8405ebb9db4cb')


package() {
  cd $srcdir/$_realname-v$pkgver
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
