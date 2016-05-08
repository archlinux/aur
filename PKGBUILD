# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=python2-mdp-git
pkgver=0.0.1
pkgrel=2
pkgdesc="A C++ framework for MDPs and POMDPs with Python bindings"
arch=('any')
url="https://github.com/Svalorzen/AI-Toolbox"
license=('GPL3')
depends=('python2')
makedepends=('boost' 'cmake' 'eigen' 'git')
source=("git+https://github.com/Svalorzen/AI-Toolbox")
md5sums=('SKIP')

build() {
  cd "$srcdir/AI-Toolbox"
  mkdir build
  cd build/
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/AI-Toolbox"
  install -Dm 755 build/MDP.so "$pkgdir/usr/lib/python2.7/site-packages/MDP.so"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm 644 License.md "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
