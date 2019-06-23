# Maintainer: nous(at)artixlinux.org

pkgname=input-veikk-config
pkgver=1.1
pkgrel=1
pkgdesc="Configuration utility for input-veikk-dkms: orientation, screen mapping and pressure mapping"
arch=('any')
url="https://github.com/jlam55555/veikk-s640-driver"
license=('GPL')
depends=('input-veikk-dkms')
source=('README'
        'input-veikk-config.sh::https://raw.githubusercontent.com/jlam55555/veikk-s640-driver/master/config.sh')
sha1sums=('8432d8a7314bc42269e976bdf5a7c75606fd4677'
          '58ef918424a29f4f2bc2a81b069bff07d3d921b1')

package() {
  cd "${srcdir}"
  sed -ri "/^PARM_DIR/ a \\\ncat /usr/share/doc/input-veikk/README" ${pkgname}.sh
  install -D -m755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}.sh"
  install -D -m755 -t "${pkgdir}/usr/share/doc/input-veikk/" "${srcdir}/README"
} 
