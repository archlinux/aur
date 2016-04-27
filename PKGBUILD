# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Dan Serban
# Contributor: Henrik Olsson

pkgname=sunflower
pkgver=0.3
pkgrel=3
pkgdesc="Small, customizable twin-panel file manager"
url="http://sunflower-fm.org"
arch=('any')
license=('GPL3')
depends=('desktop-file-utils' 'pygtk' 'librsvg' 'python2-chardet')
optdepends=('python2-gnomekeyring: password storage for remote mounts'
            'python2-notify: desktop notifications service'
            'vte: integrated vte-based terminal'
            'mutagen: audio-metadata support'
            'gvfs: mount-management'
            'python2-dbus: single application instance support')
conflicts=('sunflower-git')
options=(!strip !zipman)
source=($url/pub/${pkgname}-${pkgver}-61.tgz
        sunflower)
md5sums=('a5cd28438e83b88e5a4edeb3aacef0c6'
         '95b68d1631f9406d55bd772231b021e6')

package() {
  install -Dm755 sunflower "${pkgdir}/usr/bin/sunflower"
  install -d "${pkgdir}/usr/share/sunflower"
  cd Sunflower
  cp -r * "${pkgdir}/usr/share/sunflower"
  install -Dm644 Sunflower.desktop "${pkgdir}/usr/share/applications/sunflower.desktop"
  install -Dm644 images/sunflower_64.png "${pkgdir}/usr/share/pixmaps/sunflower.png"
}
