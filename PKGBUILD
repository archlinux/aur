#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=2.1.0
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
sha512sums=('bc191b3d037c077ae19431ab46733afab08b43f18164b933912e21a06f3e537760654c75e70c50b3d2f5598e135a553f27ae2e4e8d3b3409d1f509b50d0048ce')

package() {
  cd $srcdir/$_realname-v$pkgver
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
