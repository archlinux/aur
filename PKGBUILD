# Maintainer: Marcin Wieczorek <marcin@marcin.co>
pkgname=rsbot
pkgver=7017
pkgrel=1
pkgdesc="The world's most popular RuneScape® bot since 2006"
arch=(any)
url="http://www.powerbot.org/"
license=("Custom")
depends=(
  'java-runtime'
)

source=("http://powerbot-dequeue.netdna-ssl.com/rsbot/releases/RSBot-7017.jar" "icon.png" "rsbot.desktop")
md5sums=('3fe3eddc745d38940a97d8c14d5813ac'
         '320e7f820ccf5b741ef707315ed704c3'
         '4917cf5c0548bbbc6b16e192fd4e4a62')

package() {
  cd $srcdir
  mv RSBot* rsbot.jar

  mkdir -p "${pkgdir}/opt/rsbot/"

  install -D -m644 "rsbot.jar" "${pkgdir}/opt/rsbot/"
  install -D -m644 "rsbot.desktop" "${pkgdir}/usr/share/applications/rsbot.desktop"
  install -D -m644 "icon.png" "${pkgdir}/usr/share/pixmaps/rsbot.png"
}
