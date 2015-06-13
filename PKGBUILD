#Submitter: Gustavo Alvarez <sl1pkn07@gmaul.com>
#Maintainer: Darshit Shah <darnir@gmail.com>

pkgname=python-pyftpdlib
pkgver=1.4.0
pkgrel=3
pkgdesc="Python FTP server library"
arch=('any')
url="https://github.com/giampaolo/pyftpdlib"
license=('MIT')
source=("https://github.com/giampaolo/pyftpdlib/archive/release-${pkgver}.tar.gz")
depends=('python')
optdepends=("python-pyopenssl: required for SSL/TLS connections"
            "python-pysendfile: required for using the sendfile() call")
md5sums=('43ef0dd20d65443d296dc27f128a6998')

build(){
  cd ${srcdir}/pyftpdlib-release-${pkgver}
  python setup.py build
}

package(){
  cd ${srcdir}/pyftpdlib-release-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
