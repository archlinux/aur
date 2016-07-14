# Maintainer: Andrew Shunick <andrew at shunick dot info>
pkgname=python2-atari_py-git
pkgver=r16.d63ced3
pkgrel=1
pkgdesc="Atari environment for OpenAI gym"
arch=('any')
url="https://gym.openai.com/"
giturl="https://github.com/openai/atari-py"
license=('GPLv2')
provides=('python2-atari_py')
# Some dependencies are required to use this package with the OpenAI Gym, but may not be
# required in order to install.
depends=('python2' 'python2-pillow' 'python2-opengl' 'python2-numpy' 'python2-six' 'zlib')
makedepends=('python2-setuptools' 'cmake' 'gcc')
source=("${pkgname}::git+${giturl}")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

