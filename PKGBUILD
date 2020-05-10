#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=2.0.1
pkgrel=1
_pkgbase='errol-v2.0.1'
_realname='errol'
pkgdesc="Errol is a file sender that rely on watchdog. It can be used to watch a directory and automatically transfer the new files (or modified ones) with XMPP."
arch=(any)
url="https://blog.agayon.be/errol.html"
license=('GPLv3')
depends=('python' 'python-slixmpp' 'python-watchdog' 'python-hachiko')
options=(!emptydirs)
provides=('python-errol')

source=("https://gitlab.com/jnanar/${_realname}/-/archive/v${pkgver}/errol-v${pkgver}.tar.bz2")
sha512sums=('33cac14ba430dc0148d64e87829bf8eed3cf00db3366c335d8fe58dd6890940a43b993a828db5e2721e14dcd19df2337fab3023228f0ffa9fb162eb28ab43f95')


package() {
  cd $srcdir/$_pkgbase
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
