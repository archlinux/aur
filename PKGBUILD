# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=gym
pkgname=python2-${_gitname}-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
url="https://gym.openai.com"
license=('MIT')
depends=('python2' 'python2-numpy>=1.10.4' 'python2-requests>=2.0' 'python2-six')
makedepends=('git')
source=("git+https://github.com/openai/$_gitname")
md5sums=('SKIP')

package() {
  cd "$srcdir/${_gitname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
