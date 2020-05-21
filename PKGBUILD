# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-gtk2
pkgver=7.3.0
pkgrel=1
pkgdesc="Linux file manager and archive manager, 7Z BR RAR TAR ZST ZIP files extraction utility
"
arch=('i686' 'x86_64')
url='http://www.peazip.org/peazip-linux.html'
license=('GPL3')
depends=('lib32-curl'
         'lib32-gmp4'
         'lib32-gtk2'
         'balz'
         'paq8o'
         'p7zip'
         'upx'
         'zpaq')
options=('!emptydirs')
optdepends=('quad: A ROLZ-based file compressor' 
            'unace: Support for ace files'
            'arc: Support for arc files')
provides=('peazip')
conflicts=('peazip'
           'peazip-gtk2-build'
           'peazip-qt'
           'peazip-qt-build'
           'peazip-qt-opensuse-latest')
source=("${pkgname}-${pkgver}.rpm::https://sourceforge.net/projects/peazip/files/${pkgver}/peazip-${pkgver}.LINUX.GTK2-1.x86_64.rpm")
sha256sums=('c32e90773a2c731bc82f40fa8c63e6e507979ba68e930b446a273bfb274bddfe')

package() {
  cp -aR usr/ "${pkgdir}/"
  mv "${pkgdir}/usr/share/PeaZip" "${pkgdir}/usr/share/${pkgname}"
  rm "${pkgdir}/usr/bin/peazip"
  ln -s /usr/share/peazip-gtk2/peazip "${pkgdir}/usr/bin/peazip"
  rm -rf "${pkgdir}/usr/lib"
  chmod --recursive 755 "${pkgdir}/usr/share/peazip-gtk2/FreeDesktop_integration"
}