# Maintainer:  Christian Holme <hcmh (at) kolabnow (dot) com>

_name=bash_kernel
pkgname=jupyter-${_name}
pkgver=0.7.2
pkgrel=1
pkgdesc="A Jupyter kernel for bash"
arch=('any')
url="https://github.com/takluyver/bash_kernel"
license=('BSD')
depends=('jupyter' 'jupyter-notebook' 'bash' 'python-pexpect')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a08c84eddd8179de5234105821fd5cc210015671a0bd3cd0bc4f631c475e1670')
  

package() {
  cd "$srcdir"/${_name}-${pkgver}
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
