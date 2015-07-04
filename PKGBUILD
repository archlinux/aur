# Maintainer: Jesse Nazario <jessenzr@gmail.com>
pkgname=gdx-texturepacker
pkgver=3.2.0
pkgrel=2
pkgdesc="The gdx-texturepacker is a GUI for the awesome texture packer that comes with every libgdx distribution"
arch=('any')
url="https://code.google.com/p/libgdx-texturepacker-gui/"
license=('APACHE2')
depends=('java-environment')
source=(https://libgdx-texturepacker-gui.googlecode.com/files/$pkgname-$pkgver.zip
'gdx-texturepacker.desktop'
'gdx-texturepacker')
noextract=()
md5sums=('08afc2e883dc867a446eeec3a4890c16'
         '0d45d18964c9aa6e19149a88713e86a1'
         'f498b86370e97a057ef188f87e1b011a')

package() {
  cd $srcdir

  mkdir -p $pkgdir/usr/{share/java/$pkgname/,share/applications,bin}
  install -Dm644 $pkgname.jar $pkgdir/usr/share/java/$pkgname/
  install -Dm644 gdx-texturepacker.desktop $pkgdir/usr/share/applications/
  install -Dm7557 gdx-texturepacker $pkgdir/usr/bin
}
