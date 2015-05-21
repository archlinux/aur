pkgname=nagios-images
pkgver=0.8
pkgrel=2
pkgdesc="Collection of images and icons for the nagios system"
arch=('any')
url="http://www.nagios.org/"
license=('GPL')
#depends=('python' 'pygtk' 'gnome-python-extras' 'python-lxml')
#makedepends=('deb2targz')
source=(http://ftp.de.debian.org/debian/pool/main/n/nagios-images/nagios-images_$pkgver.tar.gz
        https://mortzu.de/files/aur/nagios-images/nagios-images-mortzu.tar.gz)
md5sums=('0b41a448c011becb75925685131d201d'
         'bf0067c7106e82299fdd1fd217ce8670')

package() {
  mkdir -p "$pkgdir/usr/share/nagios/share/images/logos"
  cp -r "$srcdir"/nagios-images-$pkgver/* "$pkgdir/usr/share/nagios/share/images/logos/"
  mv "$srcdir/helios" "$pkgdir/usr/share/nagios/share/images/logos/"
  rm -Rf "$pkgdir/usr/share/nagios/share/images/logos/debian"
}
