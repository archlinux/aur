#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=2.0.2
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
sha512sums=('1b1f27a8b45fd84f32e9cf33c98432f86ad23af4aa476729027a864e2731ae52e701a3ad3286d9db82fbf31cd2cb401295d44731174a097ba6c874f36559a7b1')


package() {
  cd $srcdir/$_realname-v$pkgver
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
