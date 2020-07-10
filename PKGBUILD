# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer: kia hamedi <kia.arta9793@gmail.com>
pkgname=jelvis
pkgver=1.0.2
pkgrel=1
pkgdesc="Smart voice assistants like Alexa, Siri and Google assistants"
arch=('any')
url="https://github.com/kiahamedi/JELVIS"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-requests' 'qt5-svg' 'python-urllib3' 'espeak' 'python-pyaudio' 'python-beautifulsoup4')
optdepends=('python-aiml: An interpreter module for AIML (Artificial Intelligence Markup Language)' 
            'python-pyttsx3: for text-to-speech conversion library in Python' 
            'python-pocketsphinx: Python interface to CMU SphinxBase and PocketSphinx libraries' 
            'python-speechrecognition: Google-powered speech recognition for Python' 
            'python-pyalsaaudio: ALSA wrappers for Python 3 for control volume')

source=(${pkgname}-${pkgver}.zip::https://github.com/kiahamedi/JELVIS-git/archive/master.zip)

package() {
  unzip -p ${pkgname}-${pkgver}.zip JELVIS-git-master/
  install -d $pkgdir/opt/$pkgname
  
  install -D -t "$pkgdir/usr/bin" "$srcdir/JELVIS-git-master/jelvis-assistant"
  install -D -t "$pkgdir/usr/share/icons/" "$srcdir/JELVIS-git-master/icons/jelvis.png"
  install -D -t "$pkgdir/usr/share/icons/" "$srcdir/JELVIS-git-master/icons/jelvis_try.png"
  install -D -t "$pkgdir/usr/share/applications/" "$srcdir/JELVIS-git-master/jelvis.desktop"
  cp -r $srcdir/JELVIS-git-master/* $pkgdir/opt/$pkgname
}

md5sums=('c7974384a9ab6f2742c00584f588956c')
