# Maintainer: Reverier-Xu <reverier.xu@woooo.tech>
pkgname=('stylish-icon-theme-git')
pkgbase=stylish-icon-theme-git
pkgver=24.03.r1.gb0e4cb85
pkgrel=1
pkgdesc="Modern icon theme for Linux Desktops"
arch=('any')
url="https://github.com/mjkim0727/Stylish-icon-theme"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/mjkim0727/Stylish-icon-theme.git')
sha256sums=('SKIP')
_pkgname=Stylish-icon-theme

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() (
        cd $_pkgname/src
        install -d "$pkgdir/usr/share/icons"
        cp -r ./Stylish* ${pkgdir}/usr/share/icons
)
