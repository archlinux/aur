# Maintainer: Tsaitang <tsaitang404@@gmail.com>
pkgname=ishell
pkgver=1.0.3
pkgrel=1
pkgdesc="轻量又高性能的SSH工具IShell：AI加持，快人一步"
arch=('any')
url="https://ishell.cc/"
depends=()
source=("$pkgname-$pkgver.zip::https://ishell-down.oss-cn-beijing.aliyuncs.com/ishell_linux_$pkgver.zip")
sha256sums=('bcd60617ad446d44e3016a1a1981e321cb18282d294faf2c1b7df269d1bbaddb')

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
  Name=ISHELL
  Exec=ishell
  Type=Application
  Categories=Utility;" > "$pkgdir/usr/share/applications/ishell.desktop"
}

