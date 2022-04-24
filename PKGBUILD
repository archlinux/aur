pkgname=rpmlauncher-bin
pkgver=1.0.6+898
pkgrel=1
pkgdesc="A better Minecraft Launcher that supports cross-platform and many functionalities for you to explore! "
url="https://www.rpmtw.com/"
license=('GPL3')
arch=('x86_64')
makedepends=('rsync')
provides=('rpmlauncher')
conflicts=('rpmlauncher')
source=("https://github.com/RPMTW/RPMLauncher/releases/download/$pkgver/RPMLauncher-Linux.zip"
	"RPMLauncher.desktop"
	"https://github.com/RPMTW/RPMLauncher/raw/develop/assets/images/Logo.png")
md5sums=('SKIP'
	 'SKIP'
	 'SKIP')
package(){
    cd "$srcdir"
    mkdir -p "$pkgdir/opt/RPMLauncher"
    rsync -av --no-o --no-g "RPMLauncher-Linux/" "$pkgdir/opt/RPMLauncher" 

    install -Dm644 -t "$pkgdir/usr/share/applications" RPMLauncher.desktop
    install -Dm644 Logo.png "$pkgdir/usr/share/pixmaps/Logo.png"
}
