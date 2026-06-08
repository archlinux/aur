# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-control-center
pkgver=1.5
pkgrel=1
pkgdesc="Shrike Control Centre - Secure Web-Based Server & File Manager GUI"
arch=('any')
url="https://codeberg.org/root1/Shrike-Linux-Uganda"
license=('GPL3')
install=shrike-control-center.install
depends=('python' 'python-flask' 'python-psutil' 'firefox')
source=("shrike-cc.py" "dashboard.html" "login.html" "shrike-cc.service" "shrike-control-center.desktop" "shrike-control-center-autostart.desktop" "shrike-control-center.install")
md5sums=('8688159a8ac06461f2705a8a3bda48f8'
         '450f5efb35d48afcba7920cb777897c2'
         'fc5faf4d8d2fdc806758573708cde992'
         '6c5c2caafc4f9549e36f03c2df71cfbc'
         'b113916d714a717e8b83f702525da8c5'
         'b39cf6ccf31893b1a6d13cf769731e68'
         '5e3ce73ec21575128b7b9cad5f67f104')

package() {
    cd "$srcdir"
    install -Dm755 shrike-cc.py "$pkgdir/usr/share/shrike-cc/shrike-cc.py"
    install -Dm644 dashboard.html "$pkgdir/usr/share/shrike-cc/templates/dashboard.html"
    install -Dm644 login.html "$pkgdir/usr/share/shrike-cc/templates/login.html"
    install -Dm644 shrike-cc.service "$pkgdir/etc/systemd/system/shrike-cc.service"
    install -Dm644 shrike-control-center.desktop "$pkgdir/usr/share/applications/shrike-control-center.desktop"
    install -Dm644 shrike-control-center-autostart.desktop "$pkgdir/etc/xdg/autostart/shrike-control-center-autostart.desktop"
}
