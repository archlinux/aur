# Maintainer: McNoggins <gagnon88 (at) Gmail (dot) com>
pkgname="python2-pythonpy"
pkgver=0.3.7
pkgrel=2
pkgdesc="command line kung fu with python (python -c, with tab completion and shorthand)"
arch=('any')
url="https://github.com/Russell91/pythonpy"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('bash-completion: shell completion support')
provides=('python2-pythonpy')
conflicts=('python-pythonpy')
source=("https://pypi.python.org/packages/source/p/pythonpy/pythonpy-$pkgver.tar.gz"
	"bash_completion.patch")
sha256sums=('6822f9c925f4e3e837698ec9569f343221fdaa32c61374e259cc90fd7d40029e'
            'c3dfc5951d9e97dbfd5a64f63f29a7f851c24c6bba565a9594bc7614303f9f69')

prepare() {
  cd "$srcdir/pythonpy-$pkgver"
  patch -Np1 -i ../bash_completion.patch
}

package() {
  cd "$srcdir/pythonpy-$pkgver"
  
  # Setup package
  python2 setup.py install --root="$pkgdir"
}
