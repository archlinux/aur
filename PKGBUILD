# Maintainer: Muhammad Al-Habib Ouadhour <HOuadhour@yandex.com>

pkgname=alun
pkgver=1.0.1
pkgrel=2
pkgdesc="A CLI tool that notify the user when there is an update, excluding AUR"
arch=('any')
url="https://github.com/HOuadhour/alun"
license=('GPL3')
depends=('cronie' 'pacman-contrib' 'libnotify' 'python' 'pacman')
optdepends=('dunst: get notification on i3 WM')
backup=('etc/alun/conf.py' 'etc/alun/crontab')
install=$pkgname.install
source=(
"https://github.com/HOuadhour/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
"https://github.com/HOuadhour/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=(
'7c1c2640fa8391e32dff0581bb1591c8cf203df2ebcbe5f96446a26644ee4f0e'
'8833cd055e38d2da997315e3f8d248cbedfacee5f38806b2cb31d1ecea37a026'
)
validpgpkeys=('6481A7A3E66A3AA39D0DD7302A60AB408C14BF70')

package() {
    cd $srcdir
    cp -a --no-preserve=ownership usr etc $pkgdir
}
