# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rsbot
pkgver=7114
pkgrel=1
pkgdesc="The world's most popular RuneScape® bot since 2006 (aka powerbot)"
arch=('any')
url="http://www.powerbot.org/"
license=("custom")
depends=('java-runtime')
noextract=("RSBot-${pkgver}.jar")
source=("https://www.powerbot.org/rsbot/releases/RSBot-${pkgver}.jar"
        'icon.png'
        'rsbot.desktop')
sha256sums=('aade6605c42d614806a98a3a4fbef1da1cf9c12b2f184c75d3e4001a5d071527'
            'f120b8935e7e1cb8b5991198c95a65f401cb0ca434f1461c7c58a39ec04ae6fc'
            '44467f5336d0806985c0972ac7710bbcdb4c5858f16716ab9ceccc45353a4240')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/share/rsbot/"

  install -D -m644 "RSBot-${pkgver}.jar" "${pkgdir}/usr/share/rsbot/rsbot.jar"
  install -D -m644 "rsbot.desktop" "${pkgdir}/usr/share/applications/rsbot.desktop"
  install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/rsbot.png"
}
