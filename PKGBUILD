pkgname=python-junos-eznc
_pkgname=py-junos-eznc
pkgver=2.5.2
pkgrel=1
pkgdesc="Python library for Junos automation"
arch=('any')
url="https://github.com/Juniper/py-junos-eznc"
license=('Apache')
depends=('python' 'python-lxml' 'python-ncclient' 'python-paramiko' 'python-scp' 'python-jinja' 'python-pyaml' 'python-netaddr' 'python-six' 'python-pyserial' 'python-yamlordereddictloader' 'python-pyparsing' 'python-transitions')
makedepends=('python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('0aab918ad6e4c559bff774d16c8efacbcfeeb908d9f7d01f29f6804477791f3e')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
