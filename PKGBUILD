# Maintainer: liberodark

pkgname=qbackup
pkgver=1.12.2.0
pkgrel=1
pkgdesc="Cross-platform file backup"
arch=('x86_64')
url="https://www.qualeed.com/en/qbackup/"
license=('custom')
depends=('xdg-utils' 'jre8-openjdk')
source_x86_64=("https://download.qualeed.com/qbackup/qBackup-${pkgver}.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('5342925f154bd4bf3d2dc415ccdce55a7e7381ed83744f47d1ea17e7dd3c82536f541b5e7f820f79795d7c4257f5923d8529654eb01c644bfe22acef63da5802'
         'a7020dc7a82e32827c3da5f67e6c3fbf6d79c8ac075fdbabaebe947b2da78105bb3fe309eae8aa0f3b679458a7dbcf2f6f2a1faf4181db9d207235b228602c24')
sha512sums_x86_64=('301a6d2813b7e5e1134b907029d0f9707b3b4d8e4e477932bdac4636c456880fa711e5dca9fe39ded61346055e720f6c9de34e189fd07c8be4070c980baa9eb1')
        
package() {
  cd $srcdir
  tar xvf qBackup-${pkgver}.tar.gz
  mkdir -p "$pkgdir/opt/qbackup/"
  cp -r "qBackup/." "$pkgdir/opt/qbackup/"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
