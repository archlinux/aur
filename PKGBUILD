# Maintainer: bastidest <bastidest at mailbox dot org>

_name=email-to-pdf-converter
pkgname=${_name}-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Converts email files (eml, msg) to pdf"
arch=('any')
url="https://github.com/nickrussler/${_name}"
license=('APACHE')
depends=('java-runtime' 'wkhtmltopdf')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}-${pkgver}.jar"::"https://github.com/nickrussler/${_name}/releases/download/${pkgver}/emailconverter-${pkgver}-all.jar")
sha256sums=('eb14f4e521fd4b28d5f70643a70811bf2d3882ee7c0593b09f229ecd8f8dfd53')

package() {
  install -Dm644 "${_name}-${pkgver}.jar" "$pkgdir/usr/share/java/${_name}/${_name}.jar"
  install -Dm755\
    <(echo -e "#/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${_name}/${_name}.jar' \"\$@\"")\
    "${pkgdir}/usr/bin/${_name}"
}
