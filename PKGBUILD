# Maintainer: McNoggins <gagnon88 (at) Gmail (dot) com>
pkgname="python-pythonpy"
pkgver=0.3.8
pkgrel=1
pkgdesc="command line kung fu with python (python -c, with tab completion and shorthand)"
arch=('any')
url="https://github.com/Russell91/pythonpy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
optdepends=('bash-completion: shell completion support')
provides=('python-pythonpy')
conflicts=('python2-pythonpy')
source=("https://pypi.python.org/packages/source/p/pythonpy/pythonpy-$pkgver.tar.gz"
	"bash_completion.patch")
sha256sums=('cb4655aaf749075b5e48b0069ca7b8eaa5ba8f1eaf1b1e2304a06e67e545a943'
            'c3dfc5951d9e97dbfd5a64f63f29a7f851c24c6bba565a9594bc7614303f9f69')

prepare() {
  cd "$srcdir/pythonpy-$pkgver"
#  patch -Np1 -i ../bash_completion.patch
}

package() {
  cd "$srcdir/pythonpy-$pkgver"
  
  # Setup package
  python setup.py install --root="$pkgdir"
}
