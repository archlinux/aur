# Maintainer: Jesse jaara <gmail.com: jesse.jaara>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=python2-youtube-dl
pkgver=2016.07.13
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.io/youtube-dl/"
license=('custom')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support')
source=(http://youtube-dl.org/downloads/${pkgver}/youtube-dl-${pkgver}.tar.gz
        http://youtube-dl.org/downloads/${pkgver}/youtube-dl-${pkgver}.tar.gz.sig)
md5sums=('8ddb0901e6e19222f93bcfd1e8189644'
         'SKIP')
validpgpkeys=('7D33D762FD6C35130481347FDB4B54CBA4826A18' 'ED7F5BF46B3BBED81C87368E2C393E0F18A9236D')

package() {
  cd youtube-dl
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python2-youtube-dl/LICENSE"

  rm -r "${pkgdir}/usr/etc"
  rm -r "${pkgdir}/usr/bin"
  rm -r "${pkgdir}/usr/share/man"
  rm -r "${pkgdir}/usr/share/doc"
}
