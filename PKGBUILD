pkgname=nx-hyprinstall
pkgver=1.0.0
pkgrel=1
pkgdesc="Nordix Installer for the frozen Hyprland stack Pree LUA - For Nordix DE Yggdrasil"
arch=('any')
url="https://github.com/jimmykallhagen/nx-hyprinstall.git"
license=('GPL v3 or later')
depends=('bash' 'git' 'base-devel')
conflicts=('Microsoft-Windows')
provides=('nx-hyprinstall')

pkgver() {
  cd "$_pkgname"
  # Detta kräver att du har gjort minst en 'git tag' i din repo
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_pkgsrc="nx-hyprinstall"
source=("$_pkgsrc::git+$url")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$_pkgsrc"
    install -Dm755 nx-hyprinstall "$pkgdir/usr/bin/nx-hyprinstall"
}

