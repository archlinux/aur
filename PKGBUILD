# Maintainer: Varakh <varakh[at]varakh[dot]de>
pkgname=brother-mfc-j430w
pkgver=3.0.1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-J430W"
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('unknown')
install='brother-mfc-j430w.install'
arch=('any')
source=("https://www.schaeferdiek.eu/downloads/Linux/AUR/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
md5sums=('adcf866f27c2fa13f81286874f7f8204')

# server doesn't like the curl header
DLAGENTS="$( IFS=$'\n'; echo "${DLAGENTS[*]}" | grep '^http::' ) --user-agent 'Mozilla/4.0'"

package() {
    cp -rf $srcdir/usr/ $pkgdir || return 1
    cp -rf $srcdir/opt/ $pkgdir || return 1
}
