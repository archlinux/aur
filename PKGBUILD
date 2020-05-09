#Maintainer: jnanar <info@agayon.be>

pkgname=python-hachiko
pkgver=0.3.0
pkgrel=1
_pkgbase='hachiko-0.3.0'
_realname='hachiko'
pkgdesc="An extremely simple asyncio-based wrapper around Watchdog."
arch=(any)
url="https://github.com/biesnecker/hachiko"
license=('MIT')
depends=('python' 'python-watchdog')
options=(!emptydirs)
provides=('python-hachiko')

source=('https://github.com/biesnecker/hachiko/archive/0.3.0.tar.gz')
sha512sums=('878fde849eefc5e0247ad5bccb45f2f56c681cce0193c9a39e1faf58baa6b174c85a073fb9200c282966b17211dfc8b636215122ed31069689fe7ddc53e489ae')


package() {
  cd $srcdir/$_pkgbase
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
