# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rsbot
pkgver=7038
pkgrel=1
pkgdesc="The world's most popular RuneScape® bot since 2006"
arch=('any')
url="http://www.powerbot.org/"
license=("custom")
depends=('java-runtime')
noextract=("RSBot-${pkgver}.jar")
source=("http://powerbot-dequeue.netdna-ssl.com/rsbot/releases/RSBot-${pkgver}.jar"
        'icon.png'
        'rsbot.desktop')
md5sums=('a4a1dbf95ee3286104946cbb0cf08492'
         '8cb7793ff1e3ab3057bb9e1218d71a87'
         '7a78455bf7f06bdac59b8699eeab362d')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/share/rsbot/"

  install -D -m644 "RSBot-${pkgver}.jar" "${pkgdir}/usr/share/rsbot/rsbot.jar"
  install -D -m644 "rsbot.desktop" "${pkgdir}/usr/share/applications/rsbot.desktop"
  install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/rsbot.png"
}
