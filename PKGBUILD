# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: bgh <aur at bgh dot io>

pkgname="cyberchef-web"
pkgver=10.21.0
pkgrel=1
pkgdesc="The Cyber Swiss Army Knife - a web app for encryption, encoding, compression and data analysis"
url="https://gchq.github.io/CyberChef/"
license=("Apache-2.0")
arch=("any")
conflicts=("cyberchef-html")
replaces=("cyberchef-html")
makedepends=("findutils" "libarchive")
source=("$pkgname-$pkgver.zip::https://github.com/gchq/CyberChef/releases/download/v$pkgver/CyberChef_v$pkgver.zip")
noextract=("$pkgname-$pkgver.zip")
b2sums=('e52f9684d2abf645d6e8989b1a69979159ba95f8f2ec5150d1a37be92c677d944296465df8f66784b3767d5a21243a99fe4739b7ab5cd39e442a4d8cb3ae4253')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps/cyberchef"
 install -d "$pkgdir/usr/share/licenses/cyberchef"
 bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$pkgdir/usr/share/webapps/cyberchef" --no-same-permissions
 mv "$pkgdir/usr/share/webapps/cyberchef/CyberChef_v$pkgver.html" "$pkgdir/usr/share/webapps/cyberchef/index.html"
 find "$pkgdir/usr/share/webapps/cyberchef/" -type f -name "*LICENSE*" -exec mv {} "$pkgdir/usr/share/licenses/cyberchef" \;
}
