pkgname=python-serpent-ai-git
_module='SerpentAI'
pkgver=r210.973af1a
pkgrel=2
pkgdesc="Game Agent Framework. Helping you create AIs / Bots to play any game you own!"
url="https://github.com/greyltc/SerpentAI"
depends=(python xorg-xwininfo xdotool opencv python-spritex python-scikit-image python-xlib python-numpy python-scipy python-h5py python-scikit-learn tesseract tesseract-data-eng python-redis redis python-aioredis python-kivy python-pyautogui python-autobahn python-editdistance python-offshoot-git python-sneakysnek-git python-mss python-tesserocr cython)
makedepends=(python-setuptools)
license=('MIT')
arch=('any')
source=("git://github.com/greyltc/SerpentAI.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_module"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

