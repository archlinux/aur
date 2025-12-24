pkgname=oplmgr-git
pkgver=1.1.1.0.gf47d7ff
pkgrel=1
pkgdesc="PS2 OPL USB Manager CLI (git)"
arch=("any")
url="https://github.com/donydaily/PS2OPLManager-cli"
license=("MIT")



depends=(
  "python"
  "psutils"
  "fzf"
)

makedepends=(
  "python-psutil"
  "python-tqdm"
)

#depends=(
#  "python"
#  "python-psutil"
#  "python-tqdm"
#  "python-pycdlib"
#  "fzf"
#)

source=("git+https://github.com/donydaily/PS2OPLManager-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd PS2OPLManager-cli
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

package() {
  cd PS2OPLManager-cli

  install -Dm755 oplmgr "$pkgdir/usr/bin/oplmgr"
  install -Dm644 utils.py "$pkgdir/usr/lib/oplmgr-git/utils.py"
  install -Dm644 iso.py "$pkgdir/usr/lib/oplmgr-git/iso.py"
  install -Dm644 splitter.py "$pkgdir/usr/lib/oplmgr-git/splitter.py"
  install -Dm644 ulcfg.py "$pkgdir/usr/lib/oplmgr-git/ulcfg.py"
  install -Dm644 usb.py "$pkgdir/usr/lib/oplmgr-git/usb.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/oplmgr-git/ui.py"

  install -Dm644 README.md "$pkgdir/usr/share/doc/oplmgr-git/README.md"
}
