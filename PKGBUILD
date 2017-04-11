# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro_org>
# hopper-v4 is upstream's package name :(

pkgname='hopper-v4'
pkgver='4.1.1'
pkgrel='1'
pkgdesc='Reverse engineering tool that lets you disassemble, decompile and debug your applications'
arch=('x86_64')
url='https://www.hopperapp.com/'
license=('custom')
depends=('hicolor-icon-theme' 'libbsd' 'ncurses5-compat-libs' 'python2' 'qt5-base')
provides=('hopper' 'hopper-v4')
conflicts=('hopper' 'hopper-v4')
source=("https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-${pkgver}-Linux.deb")
sha256sums=('140e57bee1dcea69c5bbb9c20976f4cdd123e1c69fd62bf6e08a110c24f98d71')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  # Fix package directory permissions
  chmod 755 ${pkgdir}/{opt,usr,usr/share,usr/share/doc,usr/share/applications}

  #TODO locate license file
  #install -Dm644 license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
