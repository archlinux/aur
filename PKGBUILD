# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=bhmm
pkgname=python-$_pyname
pkgver=0.5.2
pkgrel=1
pkgdesc='A toolkit for Bayesian hidden Markov model analysis of single-molecule trajectories'
url='https://github.com/bhmm/bhmm'
depends=('python-msmtools'
         'python-scipy'
         'python-six')
makedepends=('cython')
license=('LGPL3')
arch=('i686' 'x86_64')
source=("https://github.com/bhmm/$_pyname/archive/$pkgver.tar.gz")
md5sums=('49f891a6ecddee0f3921e0afce82df46')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
