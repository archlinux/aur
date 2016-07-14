# Maintainer: Andrew Shunick <andrew at shunick dot info>
pkgname=python2-doom_py-git
pkgver=r47.a242ce7
pkgrel=1
pkgdesc="Doom environment for OpenAI gym"
arch=('any')
url="https://gym.openai.com/"
giturl="https://github.com/openai/doom-py"
license=('MIT')
provides=('python2-doom_py')
depends=('python2' 'python2-numpy' 'python2-six' 'zlib' 'libjpeg' 'boost-libs' 'sdl2' 'wget' 'unzip')
makedepends=('python2-setuptools' 'cmake' 'boost' 'gcc')
source=("${pkgname}::git+${giturl}")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

