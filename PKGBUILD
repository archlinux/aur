# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: bgh <aur at bgh dot io>

pkgname="cyberchef-web"
pkgver=10.20.0
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
b2sums=('1c51537294f42f09ec7599cf87414d9508f7519224f667118370edc401bb7983c4563099022d80e27f042cd8ea86728be8650491f82b48ab4e64b4773efca0f9')
options=("!strip")

package(){
 install -d "$pkgdir/usr/share/webapps/cyberchef"
 install -d "$pkgdir/usr/share/licenses/cyberchef"
 bsdtar --extract --file "$pkgname-$pkgver.zip" --directory "$pkgdir/usr/share/webapps/cyberchef" --no-same-permissions
 mv "$pkgdir/usr/share/webapps/cyberchef/CyberChef_v$pkgver.html" "$pkgdir/usr/share/webapps/cyberchef/index.html"
 find "$pkgdir/usr/share/webapps/cyberchef/" -type f -name "*LICENSE*" -exec mv {} "$pkgdir/usr/share/licenses/cyberchef" \;
}
