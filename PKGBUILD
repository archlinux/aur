# Maintainer: Damglador <vse.stopchanskyi@gmail.com>

_pkgname=steam-update-inhibit-sleep
pkgname=$_pkgname-git
pkgver=r11.f4369bc
pkgrel=2
pkgdesc="Don't worry about system suspending when Steam installs stuff"
arch=('any')
url="https://github.com/Damglador/steam-update-inhibit-sleep.git"
depends=(python-dbus python-vdf python-inotify-simple)
makedepends=(git python-pip)
provides=("$_pkgname")
conflicts=("$_pkgname")
license=(GPLv3)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname
    pip install --no-deps --prefix="$pkgdir/usr" .
}
