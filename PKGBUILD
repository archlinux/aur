#Mantainer: danitool dgcbueu[at]gmail[dot]com
#Contributor: Marco Asa <marcoasa90 [at] gmail [dot] com>
#Contributor: Bart Broek <b_dot_broek_dot_bb_at_gmail_dot_com>
pkgname=fidocadj
pkgver=0.24.8
pkgrel=1
pkgdesc="Simple and intuitive 2D vector drawing for electronics and not only."
arch=('any')
depends=('java-environment' 'jre-openjdk>=14' 'jre-openjdk-headless>=14' 'xdg-utils' 'bash')
url="http://darwinne.github.io/FidoCadJ/"
license=('GPL')
install=fidocadj.install
source=("$pkgname.jar::https://github.com/DarwinNE/FidoCadJ/releases/download/v$pkgver/fidocadj-$pkgver.jar"
	"http://sourceforge.net/projects/fidocadj/files/misc/main-linux-package.tgz")
md5sums=('0b230bbe8ad3ac286997fd7c8da53cb9'
         'a7e66f1d610f6a129a41a65a48d368c5')
package() {
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/$pkgname/
    mkdir -p $pkgdir/usr/share/java/$pkgname/
    mkdir -p $pkgdir/usr/share/pixmaps/
    mkdir -p $pkgdir/usr/share/applications/
 
    install -m755 bin/fidocadj $pkgdir/usr/bin/
    install -m644 share/$pkgname/fidocadj.png $pkgdir/usr/share/$pkgname/
    install -m644 share/$pkgname/fidocadj-file.png $pkgdir/usr/share/$pkgname/
    install -m644 share/$pkgname/fidocadj-mime.xml $pkgdir/usr/share/$pkgname/
    install -m644 ../fidocadj.jar $pkgdir/usr/share/java/$pkgname/ 
    install -m644 share/applications/fidocadj.desktop $pkgdir/usr/share/applications/
    ln -s "/usr/share/$pkgname/fidocadj.png" "$pkgdir/usr/share/pixmaps/fidocadj.png"
}
