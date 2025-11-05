# Maintainer: leessmin <1442772970@qq.com>

pkgname=auto-konsole
pkgver=0.2.0
pkgrel=1
pkgdesc="自动切换konsole主题"
arch=('x86_64')
url="https://github.com/leessmin/auto-konsole"
license=('MIT')
depends=('plasma-desktop>=6.5.0')
options=('!strip')
source=("https://github.com/leessmin/auto-konsole/releases/download/0.2.0/auto-konsole" "auto-konsole.service")
sha256sums=('63dae91b2a0163dd51c5f8d434f1efafc62ec4528fe603905ea3195606ca8d4c' 'ceff590d976ff482dd03393e4bf5a33cb550cb4dbaf5b6e25c65ada7cbedd235')

package() {
	install -Dm755 "auto-konsole" "$pkgdir/usr/bin/auto-konsole"
 	install -Dm644 "auto-konsole.service" "$pkgdir/usr/lib/systemd/user/auto-konsole.service"
}

post_install() {
	echo "==> 安装完成！"
    echo "==> 这是一个用户 systemd 服务。要启用后台自动切换功能，请执行："
    echo ""
    echo "   systemctl --user daemon-reload"
    echo "   systemctl --user enable --now auto-konsole.service"
    echo ""
}

