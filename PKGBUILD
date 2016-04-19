# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rsbot
pkgver=7028
pkgrel=1
pkgdesc="The world's most popular RuneScape® bot since 2006"
arch=(any)
url="http://www.powerbot.org/"
license=("Custom")
depends=(
  'java-runtime'
)

source=("http://powerbot-dequeue.netdna-ssl.com/rsbot/releases/RSBot-${pkgver}.jar" "icon.png" "rsbot.desktop")
md5sums=('ff00c430af038d405b5d370c1cb2ce51'
         '8cb7793ff1e3ab3057bb9e1218d71a87'
         'e86b4f975c1ae3ad22d6b00eb0d3a987')

package() {
  cd $srcdir
  mv RSBot* rsbot.jar

  mkdir -p "${pkgdir}/opt/rsbot/"

  install -D -m644 "rsbot.jar" "${pkgdir}/opt/rsbot/"
  install -D -m644 "rsbot.desktop" "${pkgdir}/usr/share/applications/rsbot.desktop"
  install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/rsbot.png"
}
