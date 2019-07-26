# Maintainer: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Juan Simón
# Contributor: Xilon <xilonmu@gmail.com>
# Contributor: Edward Toroschin <edward.hades@gmail.com>

pkgname=grc-solarized
_pkgname=grc
pkgver=1.11.3
pkgrel=2
pkgdesc="Changed the standard colors of grc to work better with solarized colorscheme."
arch=('any')
url='https://github.com/garabik/grc'
license=('GPL')
depends=('python')
provides=('grc')
conflicts=('grc')
backup=('etc/grc.conf')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/garabik/grc/archive/v$pkgver.tar.gz"
  "conf.df"
  "conf.du"
  "conf.ip"
  "conf.ipaddr"
  "conf.ls"
  "conf.mount"
)
md5sums=(
  '17f9a0b014c771b9e4cd060113309073'
  '4e54487d7b24c2578a8f6b6501d98767'
  '70977a70a583eeb958c68f95c804af54'
  'fee461bceb83a41887834b084b815b35'
  '899c8825e38443168fad2e01888308ec'
  '7c78495f4b96096fe092a29b352abadf'
  '230a32ef922230f90bf607a217a15b99'
)

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./install.sh "$pkgdir"/usr "$pkgdir"
  install -Dm0644 "${srcdir}/conf.df" "${pkgdir}/usr/share/grc/conf.df"
  install -Dm0644 "${srcdir}/conf.du" "${pkgdir}/usr/share/grc/conf.du"
  install -Dm0644 "${srcdir}/conf.ip" "${pkgdir}/usr/share/grc/conf.ip"
  install -Dm0644 "${srcdir}/conf.ipaddr" "${pkgdir}/usr/share/grc/conf.ipaddr"
  install -Dm0644 "${srcdir}/conf.ls" "${pkgdir}/usr/share/grc/conf.ls"
  install -Dm0644 "${srcdir}/conf.mount" "${pkgdir}/usr/share/grc/conf.mount"
}
