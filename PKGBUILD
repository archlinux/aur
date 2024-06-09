# Maintainer: bastidest <bastidest at mailbox dot org>

_name=email-to-pdf-converter
pkgname=${_name}-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Converts email files (eml, msg) to pdf"
arch=('any')
url="https://github.com/nickrussler/${_name}"
license=('APACHE')
depends=('java-runtime' 'wkhtmltopdf')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}-${pkgver}.jar"::"https://github.com/nickrussler/${_name}/releases/download/${pkgver}/emailconverter-${pkgver}-all.jar")
sha256sums=('0e1a9df06a1b67c985909e26d2e7a628687a381bdef8551ffa8a22ce8162a612')

package() {
  install -Dm644 "${_name}-${pkgver}.jar" "$pkgdir/usr/share/java/${_name}/${_name}.jar"
  install -Dm755\
    <(echo -e "#/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${_name}/${_name}.jar' \"\$@\"")\
    "${pkgdir}/usr/bin/${_name}"
}
