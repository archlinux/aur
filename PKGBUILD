pkgname=python-junos-eznc
_pkgname=py-junos-eznc
pkgver=2.5.1
pkgrel=1
pkgdesc="Python library for Junos automation"
arch=('any')
url="https://github.com/Juniper/py-junos-eznc"
license=('Apache')
depends=('python' 'python-lxml' 'python-ncclient' 'python-paramiko' 'python-scp' 'python-jinja' 'python-pyaml' 'python-netaddr' 'python-six' 'python-pyserial' 'python-yamlordereddictloader' 'python-pyparsing' 'python-transitions')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('b15c46bcc04cfd9278d2ef23e1ee5e73673abd9b613beb7d86bb4f40309f2e6a')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
