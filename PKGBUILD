pkgname=nx-hyprinstall
pkgver=1.0
pkgrel=1
pkgdesc="Nordix Installer for the frozen Hyprland stack Pree LUA - For Nordix DE Yggdrasil"
arch=('x86_64' 'aarch64')
url="https://github.com/jimmykallhagen/nx-hyprinstall.git"
license=('GPL v3')
depends=('bash' 'git' 'base-devel')
conflicts=('Microsoft-Windows')
provides=('nx-hyprinstall')

_pkgsrc="nx-hyprinstall"
source=("$_pkgsrc::git+$url")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$_pkgsrc"
    install -Dm755 nx-hyprinstall "$pkgdir/usr/bin/nx-hyprinstall"
}

post_install() {
    echo "==> nx-hyprinstall installed successfully."
    echo "==> Do you want to run it now? (y/N): "
    read -r answer
    case "$answer" in
        [Yy]*)
            /usr/bin/nx-hyprinstall -a
            ;;
        *)
            echo "Run later with: nx-hyprinstall -a"
            ;;
    esac
}
