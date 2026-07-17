pkgname=silver-browser-bin
pkgver=1.1
pkgrel=2
pkgdesc="A privacy-focused desktop web browser built on Qt WebEngine/Chromium (Binary Version)"
arch=('x86_64')
url="https://github.com/tudorioan1/silver-browser"
license=('GPL3')
depends=('glibc' 'zlib')
provides=('silver-browser')
conflicts=('silver-browser')
source=("${pkgname}-${pkgver}::https://github.com/tudorioan1/silver-browser/releases/download/browser2/Silver-Browser.v1.1.-.Linux")
md5sums=('SKIP')

package() {
  install -d "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/silver-browser"

  # Cream directorul pentru scurtături desktop
  install -d "${pkgdir}/usr/share/applications"

  # Generăm fișierul .desktop pe care îl citește Rofi
  cat <<EOF > "${pkgdir}/usr/share/applications/silver-browser.desktop"
[Desktop Entry]
Version=1.1
Type=Application
Name=Silver Browser
Comment=A privacy-focused desktop web browser
Exec=silver-browser %u
Icon=internet-web-browser
Terminal=false
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;repository/reply;x-scheme-handler/http;x-scheme-handler/https;
EOF
}
