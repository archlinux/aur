# Maintainer: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>
# Contributor: Syn Waker <syncrtl64@gmail.com>

pkgname=gdx-setup
pkgver=7cc02a96
pkgrel=1
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
         '257fb7b869f2cf0c44834370031b4d5b'
         'a391aeb480342564c076cd9217536884')

pkgver() {
  cd ${srcdir}
  md5sum gdx-setup.jar --tag | tail -c 9 | head -c 8
}

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