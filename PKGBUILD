# Maintainer: MCB-SMART-BOY <mcb2720838051@gmail.com>
pkgname=gridix-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="简洁、快速、安全的跨平台数据库管理工具，Helix/Vim 风格键位"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('MIT')
depends=('gtk3' 'xdotool')
provides=('gridix')
conflicts=('gridix')
source=("https://github.com/MCB-SMART-BOY/Gridix/releases/download/v${pkgver}/gridix-linux-x86_64.tar.gz"
        "gridix.desktop"
        "LICENSE::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/master/LICENSE")
sha256sums=('5076f24dabde987c6ab0b76f314affa7e8ba1b415eab5b497d665f35c393171b'
            'SKIP'
            'SKIP')

package() {
    cd "$srcdir"
    
    # 安装二进制
    install -Dm755 gridix "$pkgdir/usr/bin/gridix"
    
    # 安装桌面文件
    install -Dm644 gridix.desktop "$pkgdir/usr/share/applications/gridix.desktop"
    
    # 安装许可证
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
