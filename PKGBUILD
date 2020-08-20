pkgname=python-transwhat
pkgver=0.2.2
pkgrel=1
epoch=1
pkgdesc="A gateway between the XMPP and the WhatsApp IM networks"
arch=('any')
url="https://github.com/stv0g/transwhat"
license=('GPL')
depends=('python' 'python-protobuf' 'python-pillow' 'python-dateutil' 'python-yowsup>=2' 'python-e4u')
makedepends=('python-setuptools' 'python2-setuptools')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/stv0g/transwhat/archive/v0.2.2.tar.gz")
md5sums=('75f44a8dd5a1abb449e0b4426f457dc7')

package() {
  cd "${srcdir}/transwhat-${pkgver}"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  find "$pkgdir" -type f -exec sed -i 's#/usr/bin/python2#/usr/bin/python#g' {} \;
}
# disabled for now
#check(){
#  cd "${srcdir}/transwhat-${pkgver}"
#  python2 setup.py test
#}
