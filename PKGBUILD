# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: bgh <aur at bgh dot io>

pkgname="cyberchef-web"
pkgver=11.0.0
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
b2sums=('5e392413be10b05ec0a4d89cae95060b982ab0c8fd6787e3612d9925ae0b16429cd04891d15ad6c5075947493e423d948d9489b7b54b681c82b95bfa41a9542c')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps/cyberchef"
 install -d "$pkgdir/usr/share/licenses/cyberchef"
 bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$pkgdir/usr/share/webapps/cyberchef" --no-same-permissions
 mv "$pkgdir/usr/share/webapps/cyberchef/CyberChef_v$pkgver.html" "$pkgdir/usr/share/webapps/cyberchef/index.html"
 find "$pkgdir/usr/share/webapps/cyberchef/" -type f -name "*LICENSE*" -exec mv {} "$pkgdir/usr/share/licenses/cyberchef" \;
}
