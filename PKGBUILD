# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=psi-notify-git
_gitname=psi-notify
pkgver=1.3.0.r7.g0eea074
pkgrel=1
pkgdesc='Minimalistic PSI notifier using libnotify (git version)'
url="https://github.com/cdown/psi-notify"
license=('MIT')
arch=('any')
depends=(libnotify)
provides=(psi-notify)
conflicts=(psi-notify)
makedepends=(git)
source=('git+https://github.com/cdown/psi-notify.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd -- "$_gitname"
    make prefix="/usr"
}

package() {
    cd -- "$_gitname"
    make prefix="/usr" DESTDIR="$pkgdir/" install
}
