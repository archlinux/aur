# Maintainer: 9M2PJU <9m2pju@hamradio.my>
<<<<<<< HEAD
pkgname=not1mm-9m2pju-git
pkgver=r1.abcdef
pkgrel=1
pkgdesc="Unofficial Arch Linux AUR package for Not1MM - Ham Radio audio tool"
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'python-pyqt6'
  'python-sounddevice'
  'python-soundfile'
  'python-levenshtein'
  'python-xmltodict'
  'python-thefuzz'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname::git+https://github.com/mbridak/not1mm.git")
md5sums=('SKIP')
provides=('not1mm')
conflicts=('not1mm')

pkgver() {
  cd "$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
=======

pkgname=not1mm-9m2pju-git
pkgver=r2188.05119a4
pkgrel=1
pkgdesc="Ham Radio Contest Logger (Not1MM fork) - Git version"
arch=('any')
url="https://github.com/mbridak/not1mm"
license=('GPL3')
depends=(
  'python'
  'python-pyqt5'
  'python-pyqt6'
  'python-requests'
  'python-dicttoxml'
  'python-xmltodict'
  'python-psutil'
  'python-sounddevice'
  'python-soundfile'
  'python-numpy'
  'python-notctyparser'
  'python-pyserial'
  'python-appdata'
  'python-gobject'
  'python-thefuzz'
  'python-levenshtein'
  'gtk4'
  'hamradio-menus'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
optdepends=('hamlib' 'flrig')
provides=('not1mm')
conflicts=('not1mm')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/not1mm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/not1mm"
  git clean -dfx
}

build() {
  cd "$srcdir/not1mm"
>>>>>>> ac3a8f8 (Initial AUR release of not1mm-9m2pju-git)
  python -m build --wheel --no-isolation
}

package() {
<<<<<<< HEAD
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

post_install() {
  echo "─────────────────────────────────────────────"
  echo "✔️  not1mm-9m2pju-git installed."
  echo "⚠️  Please ensure required runtime dependencies are installed:"
  echo "    python-numpy python-pyqt6 python-sounddevice python-soundfile"
  echo "    python-levenshtein python-xmltodict python-thefuzz"
  echo "─────────────────────────────────────────────"
=======
  cd "$srcdir/not1mm"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 not1mm/data/k6gte-not1mm.desktop "$pkgdir/usr/share/applications/k6gte-not1mm.desktop"
  install -Dm644 not1mm/data/k6gte.not1mm-128.png "$pkgdir/usr/share/pixmaps/k6gte-not1mm.png"
>>>>>>> ac3a8f8 (Initial AUR release of not1mm-9m2pju-git)
}
