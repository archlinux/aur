# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgbase=transwhat
pkgname=('python-transwhat' 'python2-transwhat')
pkgver=0.2
pkgrel=5
epoch=1
pkgdesc="A gateway between the XMPP and the WhatsApp IM networks"
arch=('any')
url="https://github.com/stv0g/transwhat"
license=('GPL')
makedepends=('python2-setuptools' 'python2-protobuf' 'python2-pillow' 'python2-dateutil' 'python2-yowsup>=2' 'python2-e4u')
options=('!strip' '!emptydirs')

source=("$pkgbase-$pkgver.tar.gz"::"git+http://github.com/stv0g/transwhat.git#branch=setuptools")
sha512sums=(SKIP)

build(){
  cd $srcdir
}

package_python-transwhat() {
  cd "${srcdir}/transwhat-${pkgver}"
}

package_python2-transwhat() {
  pkgdesc='A gateway between the XMPP and the WhatsApp IM networks - Python 2'
  depends=('python2' 'python2-protobuf' 'python2-pillow' 'python2-dateutil' 'python2-yowsup>=2' 'python2-e4u')

  cd "${srcdir}/transwhat-${pkgver}"
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}

check(){
  cd "${srcdir}/transwhat-${pkgver}"
  python2 setup.py test
}