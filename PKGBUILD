pkgname=oplmgr
pkgver=1.1.0
pkgrel=1
pkgdesc="PS2 OPL USB Manager CLI"
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

source=("https://github.com/donydaily/PS2OPLmanager-cli/archive/refs/heads/main.tar.gz")
sha256sums=("SKIP")

package() {
  cd "$srcdir/PS2OPLManager-cli-$pkgver"

  install -Dm755 oplmgr "$pkgdir/usr/bin/oplmgr"

  install -Dm644 iso.py "$pkgdir/usr/lib/oplmgr/iso.py"
  install -Dm644 splitter.py "$pkgdir/usr/lib/oplmgr/splitter.py"
  install -Dm644 ulcfg.py "$pkgdir/usr/lib/oplmgr/ulcfg.py"
  install -Dm644 usb.py "$pkgdir/usr/lib/oplmgr/usb.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/oplmgr/ui.py"

  install -Dm644 README.md "$pkgdir/usr/share/doc/oplmgr/README.md"
}
