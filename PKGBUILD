#Contributor: kia hamedi <kia.arta9793@gmail.com>
pkgname=jelvis
pkgver=1.0.2
pkgrel=2
_commit=06164e45407b8048e3101af65ddd67c5805a4c7e
#TODO think of better pkgver
pkgdesc="Intelligent audio assistant like Iron Man Jarvis"
arch=('any')
url="https://github.com/kiahamedi/JELVIS"
license=('GPL-3.0-only')
depends=('bash' 'glib2' 'python' 'python-pyqt5' 'python-urllib3'
         'python-aiml' 'python-pyttsx3'
         'python-pocketsphinx' 'python-speechrecognition' 'python-pyalsaaudio' 'python-gobject')
makedepends=('unzip')
source=(${pkgname}-${_commit}.zip::https://github.com/kiahamedi/JELVIS/archive/$_commit.zip)

package() {
  unzip -p ${pkgname}-${_commit}.zip JELVIS-$_commit/
  install -d $pkgdir/opt/$pkgname
  
  install -D -t "$pkgdir/usr/bin" "$srcdir/JELVIS-$_commit/jelvis-assistant"
  install -D -t "$pkgdir/usr/share/icons/" "$srcdir/JELVIS-$_commit/icons/jelvis.png"
  install -D -t "$pkgdir/usr/share/icons/" "$srcdir/JELVIS-$_commit/icons/jelvis_try.png"
  install -D -t "$pkgdir/usr/share/applications/" "$srcdir/JELVIS-$_commit/jelvis.desktop"
  cp -r $srcdir/JELVIS-$_commit/* $pkgdir/opt/$pkgname
}

md5sums=('8bb420df5166533353fc027ab81ee68f')
