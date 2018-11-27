pkgname=python-serpent-ai-git
_module='SerpentAI'
pkgver=r254.7c66954
pkgrel=1
pkgdesc="Game Agent Framework. Helping you create AIs / Bots to play any game you own!"
url="https://github.com/greyltc/SerpentAI"
depends=(python opencv python-scikit-image python-xlib python-numpy python-scipy python-h5py-openmpi python-scikit-learn python-crossbar tesseract tesseract-data-eng redis python-aioredis python-kivy python-pyautogui python-autobahn python-editdistance)
#TODO: python-tesserocr python-mss python-sneakysnek
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

