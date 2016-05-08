# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=gym
pkgname=python-${_gitname}-git
pkgver=0.0.1
pkgrel=2
pkgdesc="A toolkit for developing and comparing reinforcement learning algorithms."
arch=('any')
url="https://gym.openai.com"
license=('MIT')
depends=('python' 'python-numpy>=1.10.4' 'python-requests>=2.0' 'python-six')
makedepends=('git')
source=("git+https://github.com/openai/$_gitname")
md5sums=('SKIP')

package() {
  cd "$srcdir/${_gitname}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
