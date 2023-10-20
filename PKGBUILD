# Maintainer: Nicola Pagliuca <nicola.pagliuca at pm dot me>
_basename='hyprfreeze'
pkgname="$_basename-git"
pkgver=0.2.0.r0.ga1a0fa2
pkgrel=1
pkgdesc="Utility to suspend a game process (and other programs) in Hyprland"
arch=('any')
url="https://github.com/Zerodya/hyprfreeze"
license=('GPL')
depends=('bash' 'hyprland' 'jq' 'hyprprop')
makedepends=('git')
provides=("$_basename")
conflicts=("$_basename")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$_basename"
    git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

package() {
    cd "$_basename"
    install -Dm755 ./$_basename "$pkgdir/usr/bin/$_basename"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$_basename/LICENSE"
}
