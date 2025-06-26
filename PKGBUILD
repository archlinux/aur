pkgname=utmt-cli-bin
pkgver=0.8.2.0
pkgrel=1
pkgdesc="The most complete tool for modding, decompiling and unpacking Undertale (and other GameMaker games!)"
arch=('x86_64')
url="https://github.com/UnderminersTeam/UndertaleModTool"
license=('GPL3')
source_x86_64=("https://github.com/UnderminersTeam/UndertaleModTool/releases/download/${pkgver}/UTMT_CLI_v${pkgver}-Ubuntu.zip")
sha256sums_x86_64=('0f25d1f44232afe4195fd11bd948ac50520f8907b75adbd2f37bd22ff1ed73f8')
package() {
    cd "$srcdir"
    unzip "UTMT_CLI_v${pkgver}-Ubuntu.zip" -d utmt

    mkdir -p "$pkgdir/usr/share/utmt"
    cp -r utmt/* "$pkgdir/usr/share/utmt/"

    # 设置可执行权限
    chmod +x "$pkgdir/usr/share/utmt/UndertaleModCli"

    # 确保 bin 目录存在，创建软链接
    install -d "$pkgdir/usr/bin"
    ln -s /usr/share/utmt/UndertaleModCli "$pkgdir/usr/bin/utmt"
}
