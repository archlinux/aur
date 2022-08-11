# Maintainer: TransparentLC <akarin.dev>
# Packager: Malingshu <myy0222@gmail.com>

pkgname=xdao
pkgrel=1
pkgver=1.0.4.r10.c660b27
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
pkgver() {
  cd "${srcdir}/xdao"
  printf "1.0.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "${pkgdir}"
  mkdir -p usr/bin
  mkdir -p usr/share/xdao
  mkdir -p XDG_CONFIG_HOME/xdcmd
  echo "python /usr/share/xdao/main.py" > usr/bin/xdao
  mv ${srcdir}/xdao/* usr/share/xdao
  chmod +x usr/bin/xdao
}

