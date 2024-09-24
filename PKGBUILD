# Maintainer: Tsaitang <tsaitang404@@gmail.com>
pkgname=ishell
pkgver=1.0.6
pkgrel=1
pkgdesc="轻量又高性能的SSH工具IShell：AI加持，快人一步"
arch=('x86_64')
url="https://ishell.cc/"
depends=()
source=("$pkgname-$pkgver.zip::https://ishell-down.oss-cn-beijing.aliyuncs.com/ishell_linux_$pkgver.zip")
sha256sums=('b30f7a741eeca20bfb77a1e8eed1afa39cf635a3210769da1c39dc1ff754bf9f')

package() {
  # 定义安装目标路径
  install_dir="$pkgdir/usr/share/ishell"

  # 创建安装目标路径
  mkdir -p "$install_dir"

  # 解压软件包到安装目标路径
  bsdtar xf "$srcdir/ishell-$pkgver.zip" -C "$install_dir"

  # 在安装目标路径创建快捷方式
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/share/ishell/bundle/ishell" "$pkgdir/usr/bin/ishell"

  # 在安装目标路径创建.desktop文件
  mkdir -p "$pkgdir/usr/share/applications/"
  echo "[Desktop Entry]
  Name=ishell
  Exec=ishell
  Icon=/usr/share/ishell/bundle/data/flutter_assets/static/img/logo.png
  Type=Application
  Categories=Utility;" > "$pkgdir/usr/share/applications/ishell.desktop"
}

