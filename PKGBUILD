# Maintainer: Erikas Rudinskas (erikmnkl@gmail.com)
# The Thunar-thumbnailer plugin is not maintainable anymore (latest version at 2008) and should not be any updates in the future.
# You can check at: http://git.xfce.org/apps/thunar-thumbnailers/

pkgname=thunar-thumbnailers
pkgver=0.4.1
pkgrel=1
arch=('any')
pkgdesc="Display various file previews (thumbnails) in Thunar file manager."
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-thumbnailers"
license=('CCPL:cc-by-nc-sa')
depends=('imagemagick')
makedepends=('git' 'xfce4-dev-tools')
optdepends=(
    'tetex: LaTeX files support'
    'raw-thumbnailer: Raw Digital Camera Images support'
    'grace: Grace files support'
    'ffmpegthumbnailer: Thumbnails for video files support'
)
source=('git://git.xfce.org/apps/thunar-thumbnailers')
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
