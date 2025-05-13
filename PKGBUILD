# Maintainer: bastidest <bastidest at mailbox dot org>

_name=email-to-pdf-converter
pkgname=${_name}-bin
pkgver=3.0.0
pkgrel=2
pkgdesc="Converts email files (eml, msg) to pdf"
arch=('any')
url="https://github.com/nickrussler/${_name}"
license=('Apache-2.0')
depends=('java-runtime' 'wkhtmltopdf')
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}-${pkgver}.jar"::"https://github.com/nickrussler/${_name}/releases/download/${pkgver}/emailconverter-${pkgver}-all.jar")
sha256sums=('a0d8cdfcd169af6340936b9280bd2b178e79f9d496bebdb53b1e49a4d88f378c')

package() {
  install -Dm644 "${_name}-${pkgver}.jar" "$pkgdir/usr/share/java/${_name}/${_name}.jar"
  install -Dm755\
    <(echo -e "#/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${_name}/${_name}.jar' \"\$@\"")\
    "${pkgdir}/usr/bin/${_name}"
}
