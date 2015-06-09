# Maintainer: "UnCO" Lin <trash__box <_at_> 163.com>

pkgname=gtk-theme-espresso
pkgver=0.1
pkgrel=1
pkgdesc="Espresso is a new theme based on Macchiato 0.3."
arch=('any')
url="http://gnome-look.org/content/show.php/3spr3sso?content=162127"
license=('CCPL:nc-sa')
depends=('gtk-engine-murrine')
makedepends=('unrar')
options=('!strip')
source=("http://gnome-look.org/CONTENT/content-files/162127-3spr3sso_by_huku9h1f-d6w2rfn.rar"
        "http://gnome-look.org/CONTENT/content-files/113817-Espresso.tar.gz"
        murrine.patch)

build() {
  tar xf Espresso/Espresso\ ${pkgver}.tar.gz
  cd Espresso\ ${pkgver}/gtk-2.0
  patch -p1 -i "$srcdir"/murrine.patch
}

package() {
  target_path="$pkgdir/usr/share/themes/Espresso"
  install -dm755 $target_path
  cp -a Espresso\ ${pkgver}/gtk-2.0 $target_path

  cp -a 3spr3sso/gtk-3.0 $target_path

  find "$pkgdir/" -type d -exec chmod 755 "{}" \;
  find "$pkgdir/" -type f -exec chmod 644 "{}" \;
}
md5sums=('bb13e84442d86cf8a71473a260933559'
         'ca4e251cb02f956ba5dbd8e08fa0a695'
         '5890bb5ae72c868d0baf03dbe4aaa88a')
