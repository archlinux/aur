# $Id: PKGBUILD 211455 2017-02-09 14:01:22Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=urbanterror-data
pkgver=4.3.2
pkgrel=2
epoch=2
pkgdesc="A team-based tactical shooter based on the Quake 3 Engine (data files)"
arch=('any')
url="http://www.urbanterror.info"
license=('custom:freeware')
backup=('opt/urbanterror/q3ut4/server.cfg' 'opt/urbanterror/q3ut4/mapcycle.txt')
source=("http://www.happyurtday.com/releases/4x/UrbanTerror${pkgver//.}_full.zip")
sha512sums=('6611fd9c6309a95e479015764b082934f072a17394764491d8b025ab0eb977954807cc942ca5bd54bc9cfa512850e0f4d3994c94e91eb27eeffbde805a749d2a')

package() {
  mkdir -p $pkgdir/opt/urbanterror
  cp -r $srcdir/UrbanTerror43/q3ut4 $pkgdir/opt/urbanterror/q3ut4

  install -Dm644 $srcdir/UrbanTerror43/q3ut4/readme43.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  echo -e "\nseta cl_cURLLib \"/usr/lib/libcurl.so.4\"" >> $pkgdir/opt/urbanterror/q3ut4/autoexec.cfg
}

# vim: sw=2:ts=2 et:
