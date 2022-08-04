# Maintainer: TransparentLC <akarin.dev>
# Packager: Malingshu <myy0222@gmail.com>

pkgname=xdao
pkgver=1.0.1
pkgrel=3
pkgdesc="An nmbXD TUI cli written in Python."
arch=('any')
url="https://github.com/TransparentLC/xdcmd"
license=('AGPL-3.0')
sha256sums=('SKIP')
depends=(
  'python>=3.10.0'
  'python-beautifulsoup4'
  'python-lxml'
  'python-prompt_toolkit'
  'python-requests'
)
makedepends=(
  'git'
)
optdepends=(
  'chafa'
)
install=${pkgname}.install
source=("${pkgname}::git+https://ghproxy.com/https://github.com/TransparentLC/xdcmd.git")

package() {
  cd "${pkgdir}"
  mkdir -p usr/bin
  mkdir -p usr/share/xdao
  echo "python /usr/share/xdao/main.py" > usr/bin/xdao
  touch usr/share/xdao/config.ini 
  mv ${srcdir}/xdao/* usr/share/xdao
  chmod +x usr/bin/xdao
  chmod o+r+w usr/share/xdao/config.ini 
}

