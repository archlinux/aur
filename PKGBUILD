# Maintainer: T. Maedel <aur[at]tbspace[dot]de>

pkgname=lookit
pkgver=1.2.0.gitd0b701a6
pkgrel=1
pkgdesc="Quick screenshot uploader"
arch=('any')
url="https://github.com/zachtib/lookit"
license=('GPL')
depends=('python2-notify'
	'python2-gconf'
	'python2-keyring'
	'python2-keyrings-alt'
	'libgnome-keyring'
	'python2-gobject'
	'python2-xdg'
	'python2-libappindicator'
	'python2-paramiko'
	'python2-pycurl'
	'xdg-user-dirs'
	'libindicator-gtk2>=0.3.0'
	'libdbusmenu-glib>=0.1.1')
makedepends=('intltool' 'python2' 'git')
options=(!libtool)
_commit=a435f3c3a188266c5d67361c9a15898ed0b701a6
source=(https://github.com/zachtib/lookit/archive/${_commit}.zip)
md5sums=('3c9159a4aba1c0da8a4753d9017dab62')

build() {
  cd "$srcdir/lookit-${_commit}"

  python2 setup.py build
}

package() {
  cd "$srcdir/lookit-${_commit}"
  
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  rm "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
  rm "$pkgdir/usr/share/icons/ubuntu-mono-dark/icon-theme.cache"
  rm "$pkgdir/usr/share/icons/ubuntu-mono-light/icon-theme.cache"
}
