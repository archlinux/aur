# Maintainer: Jesse Nazario <jessenzr@gmail.com>
pkgname=gdx-setup
pkgver=`date +"%Y%m%d"`
pkgrel=11
pkgdesc="Libgdx project setup"
arch=('any')
url="http://libgdx.badlogicgames.com"
license=('APACHE2')
depends=('java-environment')
source=('http://libgdx.badlogicgames.com/nightlies/dist/gdx-setup.jar'
        'gdx-setup'
        'gdx-setup.desktop'
        'http://libgdx.badlogicgames.com/img/features_hover.png')
md5sums=('SKIP'
         '2c7c983f8fa177e78a7e19cf94236899'
         'ff0443d3594a1ae79ab59ef2fa41005b'
         'a391aeb480342564c076cd9217536884')

package() {
  cd $srcdir

  chmod +x gdx-setup
  mkdir -p $pkgdir/usr/{share/java/$pkgname/,bin,share/pixmaps,share/applications}
  install -Dm644 $pkgname.jar $pkgdir/usr/share/java/$pkgname/
  install -Dm644 features_hover.png $pkgdir/usr/share/pixmaps/gdx-setup.png
  install -Dm644 gdx-setup.desktop $pkgdir/usr/share/applications/
  install -Dm7557 gdx-setup $pkgdir/usr/bin
  #make DESTDIR="$pkgdir/" install
}
