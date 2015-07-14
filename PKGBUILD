# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=keysync
pkgver=0.2.1.1
pkgrel=1
pkgdesc='convert OTR keystores into other keystore formats for moving keys into a new IM app'
arch=('any')
url="https://guardianproject.info/apps/keysync/"
makedepends=('desktop-file-utils' 'python2-setuptools')
depends=('python2' 'python2-beautifulsoup3' 'python2-psutil' 'python2-python-potr'
         'python2-pyasn1' 'python2-crypto' 'python2-pyjavaproperties'
         'python2-pyparsing' 'python2-pgpdump' 'python2-qrcode' 'hicolor-icon-theme')
optdepends=('tk: for GUI'
            'pymtp: for MTP on GUI')
license=('GPL3')
install=keysync.install
sha256sums=('1002832c89a623b73a2964c8f83c455b377feb602fd6b898a62382ca40ea2f28')
source=($pkgname-$pkgver.tar.gz::https://github.com/guardianproject/$pkgname/archive/${pkgver}.tar.gz)

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
