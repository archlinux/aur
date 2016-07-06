# Maintainer: Erez Raviv (erezraviv@gmail.com)
# yes, I know the previous version had the PKGBUILD script look for the latest revision.  
# yes, this is more hard coded but this way when the upstream code gets updated (no - they don't do it every day) 
#   this PKGBUILD is updated as well and this will let helpers know that there is anew verion.  No not really the "arch way"
#   but neither are helpers :)
pkgname=chirp-daily
pkgver=20160706
pkgrel=1
pkgdesc="Latest build for GUI tool for programming ham radios"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL')
depends=('python2-lxml' 'python2-pyserial' 'desktop-file-utils' 'pygtk')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
install=
sha1sums=("99c983471914017cc0f3b3f006a6de2101e95d9e")
source=("http://trac.chirp.danplanet.com/chirp_daily/daily-20160706/chirp-daily-20160706.tar.gz")

build() {
  tar zxvf $pkgname-$pkgver.tar.gz
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

