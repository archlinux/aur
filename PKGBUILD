# Contributor: 3ED <krzysztof1987@gmail.com>

pkgname=gtk2-theme-slickness
_urlid=83117411
pkgver=2.2.2
pkgrel=1
pkgdesc="A nice, dark (black & white) theme for gnome desktop."
arch=('i686' 'x86_64')
url="http://www.gnome-look.org/content/show.php/SlicknesS?content=71993"
license=('GPL')
groups=('gtk2-themes')
depends=('gtk2')
install="info.install"
source=("http://www.deviantart.com/download/$_urlid/SlicknesS_by_Th3R0b.gz")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('565fa215c272d8e6340fc0a33049aa15')

build() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/themes/" || return 1

  # Moving theme to pkg directory
  mv "$srcdir/SlicknesS" "$pkgdir/usr/share/themes/" || return 1
  # Setting up files and directory as '-rw-r--r--'
  chmod -R 644 "$pkgdir/" || return 1
  # Setting up directory as 'rwxr-xr-x'
  chmod -R a+X "$pkgdir/" || return 1
}
# vim:set ts=2 sw=2 et:
#$cat=x11
