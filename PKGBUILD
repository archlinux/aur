# Maintainer: Psalms Christopher Matovu <psalmschristophermatovu@gmail.com>
pkgname=goto-dir
_upstream=goto
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight directory shortcut manager for POSIX shells"
arch=('any')
url="https://github.com/byteoverride/goto"
license=('MIT')
depends=('coreutils')
optdepends=(
    'bash: Bash shell integration and completion'
    'zsh: Zsh shell integration and completion'
    'fish: Fish shell integration and completion'
)
conflicts=('goto')
source=("$_upstream-$pkgver.tar.gz::https://github.com/byteoverride/$_upstream/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$_upstream-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
