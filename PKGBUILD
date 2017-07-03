# Maintainer: Fabio Loli <loli_fabio@protonmail.com>

pkgname=headset-bin
pkgver=1.5.4
pkgrel=1
pkgdesc="An Electron-based music player for the busy ones"
arch=('x86_64')
url="http://headsetapp.co/"
license=(MIT)
depends=('alsa-lib'
         'gconf'
         'gnuplot'
         'nodejs'
         'nss'
         'libxtst'
         'libxss'
         'gcc-libs-multilib')
provides=('headset')
conflicts=('headset')
#options('!emptydirs')
source=("https://github.com/headsetapp/headset-electron/releases/download/v${pkgver}-deb/Headset_${pkgver}_amd64.deb"
        "MIT::https://github.com/headsetapp/headset-electron/raw/master/LICENSE")
md5sums=('c0619b1508545ac25fa7722aa9b6a0c0'
         'SKIP')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  rm -r ${pkgdir}/usr/share/lintian
  chmod 755 -R ${pkgdir}/
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install MIT ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/lib/Headset/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/lib/Headset/LICENSES.chromium.html ${pkgdir}/usr/share/licenses/${pkgname}
}
