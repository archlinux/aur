# Maintainer: Pad Ster <padspambox at gmail dot com>

pkgname=gnome-shell-theme-mist-git
pkgver=21.ebf614c
pkgrel=1
pkgdesc="A simple, elegant, minimal gnome-shell theme"
arch=('any')
url="https://github.com/theRealPadster/Mist-theme.git"
groups=('gnome-shell-extensions')
license=('CCPL:by-nc-sa')
depends=('gnome-shell')
source=('git+https://github.com/theRealPadster/Mist-theme.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/Mist-theme/Mist
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd $srcdir/Mist-theme/Mist
    
    mkdir -p ${pkgdir}/usr/share/themes/Mist
    cp -r gnome-shell ${pkgdir}/usr/share/themes/Mist/
    chmod -R 755 ${pkgdir}/usr/share/themes/Mist
}
