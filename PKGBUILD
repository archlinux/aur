# Maintainer: bastidest <bastidest at mailbox dot org>

_name=email-to-pdf-converter
pkgname=${_name}-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Converts email files (eml, msg) to pdf"
arch=('any')
url="https://github.com/nickrussler/${_name}"
license=('APACHE')
depends=('jre-openjdk' 'wkhtmltopdf')
provides=("${_name}")
conflicts=("${_name}")
replaces=("${_name}")
source=("${_name}-${pkgver}.jar"::"https://github.com/nickrussler/${_name}/releases/download/${pkgver}/emailconverter-${pkgver}-all.jar")
sha256sums=('961affdb375110ca67a03d28cbe52c8387d2091973017875f6c5f9081c35b9fe')

package() {
  install -Dm644 "${_name}-${pkgver}.jar" "$pkgdir/usr/share/java/${_name}/${_name}.jar"
  install -Dm755\
    <(echo -e "#/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${_name}/${_name}.jar' \"\$@\"")\
    "${pkgdir}/usr/bin/${_name}"
}
