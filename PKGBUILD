# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=gmvault
pkgver=1.9.1
pkgrel=1
pkgdesc="Gmvault is a tool for backing up your gmail account and never lose email correspondence."
arch=(any)
url="http://gmvault.org"
license=('AGPL')
depends=('python2' 'python2-logbook' 'python2-chardet' 'python2-imapclient')
makedepends=('python2-distribute')
source=("https://bitbucket.org/gaubert/gmvault-official-download/downloads/gmvault-v$pkgver-src.tar.gz"
        "use-python2.patch")
md5sums=('3a681c0175fd655646d34ae7fc03f42d'
         '7d6b1d651a295d1a9fc00c42af59b02e')

build() {
  cd $pkgname-$pkgver

  patch -p1 < ../use-python2.patch
}

package() {
  cd $pkgname-$pkgver

  python2 setup.py install --root "$pkgdir" --optimize=1
}
