# Maintainer: Edgard Castro <castro@edgard.org>
# Contributors: Skunnyk <skunnyk@archlinux.fr>

pkgname=gmvault
pkgver=1.9.1
pkgrel=3
pkgdesc="Gmvault is a tool for backing up your gmail account and never lose email correspondence."
arch=(any)
url="http://gmvault.org"
license=('AGPL')
conflicts=('gmvault-git')
provides=('gmvault')
depends=('python2' 'python2-logbook' 'python2-chardet' 'python2-imapclient' 'python2-backports.ssl')
makedepends=('python2-distribute')
source=("https://bitbucket.org/gaubert/gmvault-official-download/downloads/gmvault-v$pkgver-src.tar.gz"
        "use-python2.patch")
sha256sums=('51e670fbbdc4065f51514d2eb3ee65baeedaabfeb01c7987a3c6b5375c43d739'
         '5c35818f84858775871e2d762db83385a69aa2c35c56f57ce7c4867ef44382d1')

build() {
  cd $pkgname-$pkgver

  patch -p1 < ../use-python2.patch
}

package() {
  cd $pkgname-$pkgver

  python2 setup.py install --root "$pkgdir" --optimize=1
}
