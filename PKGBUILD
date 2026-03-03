# Maintainer: alvaniss <alvaniss1g@gmail.com>
pkgname=python-mc-check-git
pkgver=1.0.7
pkgrel=1
pkgdesc="Minecraft server status checker"
arch=('any')
url="https://github.com/alvaniss/mc-check"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-requests'
)
makedepends=('git')
source=("mc_check.py::https://raw.githubusercontent.com/alvaniss/mc-check/main/mc_check.py")
sha256sums=('SKIP')

package() {
  install -Dm644 mc_check.py \
    "$pkgdir/usr/lib/python$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')/site-packages/mc_check.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mc-check" <<EOF
#!/usr/bin/env python
from mc_check import main
main()
EOF
}
