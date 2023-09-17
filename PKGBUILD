# Maintainer :  Biginoz 
# Contributor: syntheit <daniel@matv.io>
pkgname='google-messages'
pkgver=1.4.2
pkgrel=2
pkgdesc="A native-like OS X, Windows, & Linux desktop app for Google Messages"
arch=('x86_64')
url="https://www.messagesfordesktop.com/"
license=('custom')
makedepends=('nodejs-nativefier')
source=("google-messages.png::https://raw.githubusercontent.com/kelyvin/Google-Messages-For-Desktop/v1.4.0/android-messages-logo.png"
        "google-messages.desktop"
		"google-messages-linux.zip::https://github.com/kelyvin/Google-Messages-For-Desktop/releases/download/v$pkgver/google-messages-linux_v$pkgver.zip")
sha256sums=('3c938c748fbef4cdd72e638b26aa35f3e2da8045a0c5490ede8b6ef5603f1b2c'
            '6909e255521af089883f18740fc91c7743897c99d4ece0784b969cea5bc480ae'
            '204112783720e2428ec0ad78ebd9f95f30bf9c77959d4ebd6232be30da98970a')



package() {
	
mkdir -p "$pkgdir"/opt
  msg2 "google-messages-linux.zip"
  unzip google-messages-linux.zip -d "$pkgdir"/opt
  	mkdir -p "$pkgdir"/usr/bin
	ln -s /opt/GoogleMessages-linux-x64/GoogleMessages "$pkgdir"/usr/bin/google-messages
 install -Dm644 "$pkgdir"/opt/GoogleMessages-linux-x64/LICENSE "$pkgdir"/usr/share/licenses/google-messages/LICENSE
	install -Dm644 google-messages.png "$pkgdir"/usr/share/pixmaps/google-messages.png
	install -Dm644 google-messages.desktop "$pkgdir"/usr/share/applications/google-messages.desktop
}

	
	
