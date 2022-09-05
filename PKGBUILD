# Maintainer: Varakh <varakh[at]varakh[dot]de>
pkgname=brother-mfc-j430w
pkgver=3.0.1
pkgrel=4
pkgdesc="LPR and CUPS driver for the Brother MFC-J430W"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('unknown')
install='brother-mfc-j430w.install'
arch=('any')
source=("https://downloads.varakh.de/Linux/AUR/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
depends=('lib32-glib2')
sha256sums=('7e081638195d09e7165a80d80f241c4bb9803b792da106ce5a6db785820c1497')

# server doesn't like the curl header
DLAGENTS="$( IFS=$'\n'; echo "${DLAGENTS[*]}" | grep '^http::' ) --user-agent 'Mozilla/4.0'"

package() {
    cp -rf $srcdir/usr/ $pkgdir || return 1
    cp -rf $srcdir/opt/ $pkgdir || return 1
}
