# Maintainer: TransparentLC <akarin.dev>
# Packager: Malingshu <myy0222@gmail.com>

pkgname=xdao
pkgver=1.0.0
pkgrel=1
pkgdesc="An Xdnmb TUI cli written in Python."
arch=('any')
url="https://www.nmbxd1.com/t/50750950"
license=('AGPL-3.0')
sha256sums=('SKIP')
depends=(
  'python-beautifulsoup4'
  'python-lxml'
  'python-prompt_toolkit'
  'python-requests'
  'chafa'
)
makedepends=(
  'git'
)
optdepends=()
source=("${pkgname}::git+https://hub.fastgit.xyz/TransparentLC/xdcmd.git")

package() {
  cd "${pkgdir}"
  mkdir -p usr/bin
  mkdir -p usr/share/xdao
  echo "python /usr/share/xdao/main.py" > usr/bin/xdao
  touch usr/share/xdao/config.ini 
  mv ${srcdir}/xdao/* usr/share/xdao
  chmod +x usr/bin/xdao
  chmod o+r+w usr/share/xdao/config.ini 
  
  echo -----------------------------------------------------------
  echo "如需添加饼干，请自行访问用户系统扫描解析饼干二维码后"
  echo "将cookie字段值填入usr/share/xdao/config.ini中（ゝ∀ ･）"
  echo -----------------------------------------------------------
}


