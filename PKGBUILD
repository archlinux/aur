pkgname=bunzbar
pkgver=$(python3 -c "import json;from urllib.request import urlopen;print('0.'+str(len(json.load(urlopen('https://pypi.org/pypi/bunzbar/json'))['releases'])))"
)
pkgrel=1
epoch=
pkgdesc="display useful information in status bar"
arch=('any')
url="https://gitlab.com/02742/bunzbar"
license=('GPLv3')
groups=()
depends=('python3')
makedepends=("coreutils"
  "python3"
  "python-pip")
checkdepends=()
optdepends=()
provides=('bunzbar')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
  pip install -U bunzbar
}

package() {
  install -D -m755 ~/.local/bin/bunzbar "$pkgdir/usr/local/bin/bunzbar"
}
