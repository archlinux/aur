# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=zpdic
pkgver=1.15.1
pkgrel=1
pkgdesc="A modern solution for editing dictionaries."
url="http://ziphil.web.fc2.com/application/download/2.html"
license=('custom')
arch=('any')
conflicts=('zpdic')
provides=('zpdic')
depends=('java-openjfx')
source=("v${pkgver}-full.zip::https://www.dropbox.com/sh/g75rqn97sdlpp0b/AABEFUdM_TaFJbI3m_ybR2jha/v${pkgver}-full.zip?dl=1"
        'zpdic'
        'LICENSE')
noextract=("v${pkgver}-full.zip")
md5sums=('e1792549c6c070a8cc3ac5a91fbcb9ba'
         SKIP
         SKIP)

package() {
  install -Dm755 {,"${pkgdir}/usr/bin/"}zpdic
  install -Dm644 {,"${pkgdir}/usr/share/licenses/${pkgname}/"}LICENSE

  unzip "v${pkgver}-full.zip" -d "v${pkgver}-full"
  cd "v${pkgver}-full"
  for f in `find -type f` ; do
    install -Dm644 {,"${pkgdir}/usr/share/${pkgname}/"}"${f}"
  done
}
