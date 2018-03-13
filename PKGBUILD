#Maintainer: jnanar <info@agayon.be>

pkgname=python-errol
pkgver=1.0.7
pkgrel=1
_pkgbase='errol-v1.0.7-d72cc2aa0feec976bcaaca73756554e501f6b290'
_realname='errol'
pkgdesc="Errol is a file sender that rely on inotify. It can be used to watch a directory and automatically transfer the new files (or modified ones) with XMPP."
arch=(any)
url="https://blog.agayon.be/errol.html"
license=('GPLv3')
depends=('python' 'python-slixmpp' 'python-aionotify')
options=(!emptydirs)
provides=('python-errol')
#optdepends=('')

source=('https://gitlab.com/jnanar/errol/repository/v1.0.7/archive.tar.bz2')
sha512sums=('b6ccbb5649e7398014a1a41ab48858217a318556540a1032656d0b91e38e0b63e976ef967c3a7e3e740a2816d577659af8ce5e0e5be4631e20158fc4359287a0')


package() {
  cd $srcdir/$_pkgbase
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
