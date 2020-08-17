# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rsbot
pkgver=8.1.2
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
sha256sums=('dc07e7934da4bbd43b0543e0fd36e0104c6511e1a1f83bf84fbcac418a26171b'
            'f120b8935e7e1cb8b5991198c95a65f401cb0ca434f1461c7c58a39ec04ae6fc'
            '44467f5336d0806985c0972ac7710bbcdb4c5858f16716ab9ceccc45353a4240')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/share/rsbot/"

  install -D -m644 "RSBot-${pkgver}.jar" "${pkgdir}/usr/share/rsbot/rsbot.jar"
  install -D -m644 "rsbot.desktop" "${pkgdir}/usr/share/applications/rsbot.desktop"
  install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/rsbot.png"
}
