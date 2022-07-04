pkgname=rpmlauncher-bin
_pkgname=rpmlauncher
pkgver=1.0.7+918
pkgrel=1
pkgdesc="A better Minecraft Launcher that supports cross-platform and many functionalities for you to explore! "
url="https://www.rpmtw.com/"
license=('GPL3')
arch=('x86_64')
makedepends=('rsync')
provides=('rpmlauncher')
conflicts=('rpmlauncher')
source=("$_pkgname-$pkgver-$pkgrel.zip::https://github.com/RPMTW/RPMLauncher/releases/download/$pkgver/RPMLauncher-Linux.zip"
	"RPMLauncher.desktop"
	"https://github.com/RPMTW/RPMLauncher/raw/develop/assets/images/Logo.png")
sha256sums=('5a1f0509d49946f9ae0eb8051b9b2a47124846bd891143908175620602ba8b40'
            'af2720db5735cc5e9fb9fe76e20f12d51da452e5360fb90a7086f360efbb3828'
            '4fb011f8924ae51231875788181bd5800345500745364fb921c22448f368d570')
package(){
    cd "$srcdir"
    mkdir -p "$pkgdir/opt/RPMLauncher"
    rsync -av --no-o --no-g "RPMLauncher-Linux/" "$pkgdir/opt/RPMLauncher" 

    install -Dm644 -t "$pkgdir/usr/share/applications" RPMLauncher.desktop
    install -Dm644 Logo.png "$pkgdir/usr/share/pixmaps/Logo.png"
}
