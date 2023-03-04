# Maintainer: bastidest <bastidest at mailbox dot org>

_name=email-to-pdf-converter
pkgname=${_name}-bin
pkgver=2.5.3
pkgrel=1
pkgdesc="Converts email files (eml, msg) to pdf"
arch=('any')
url="https://github.com/nickrussler/${_name}"
license=('APACHE')
depends=('jre-openjdk' 'wkhtmltopdf')

source=("${_name}.jar"::"https://github.com/nickrussler/${_name}/releases/download/${pkgver}/emailconverter-${pkgver}-all.jar")
sha256sums=('67608fe75bad3eae422e5b8ad8e4cde1de9d54254237bc2173c0e2301f02f2cf')

package() {
  install -Dm644 "${_name}.jar" "$pkgdir/usr/share/java/${_name}/${_name}.jar"
  install -Dm755\
    <(echo -e "#/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${_name}/${_name}.jar' \"\$@\"")\
    "${pkgdir}/usr/bin/${_name}"
}
