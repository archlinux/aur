# Maintainer: kancko <kancko>

pkgname=gnome-shell-rounded-blur-blur-my-shell-extension
pkgver=70
pkgrel=2
pkgdesc="blur-my-shell extension variant for gnome-shell-rounded-blur"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell' 'gnome-shell-extensions')
makedepends=('git')
source=("git+https://github.com/aunetx/blur-my-shell.git#tag=v$pkgver"
        "Add_corner_radius_to_NativeDynamicBlurEffect.patch")
sha256sums=('f41f55c7e01ec748caa553e541fbe615ccc0cabc023b69f2dd754e112b0626f7'
            '83521b75a048f9ff792b9532d542a76303e13f5c86320c545073195eab59e49c')

prepare() {
  cd blur-my-shell
  patch -p1 -i "$srcdir/Add_corner_radius_to_NativeDynamicBlurEffect.patch"
}

build() {
  cd blur-my-shell
  make build
}

package() {
  cd blur-my-shell
  make install
}
