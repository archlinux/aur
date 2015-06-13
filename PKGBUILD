# Maintainer: ant32 <antreimer@gmail.com>

pkgname=quasar-single
pkgver=2.2.1
pkgrel=2
pkgdesc="Business accounting software (Server, Client, Sample Company, Help, Tools)"
url="http://www.linuxcanada.com"
arch=('x86_64' 'i686')
license=('Commercial')
depends=('icu52' 'tcl' 'qt3' 'xinetd' 'postgresql')
optdepends=('polymer: KDE QT style Plastik')
provides=('quasar-server' 'quasar-client' 'quasar-sample-company' 'quasar-help-en-ca' 'quasar-tools')
conflicts=('quasar-server' 'quasar-client' 'quasar-sample-comp${_arch}any' 'quasar-help-en-ca' 'quasar-tools')
source_i686=(ftp://linuxcanada.com/pub/Quasar/${pkgver}/binaries/i386-i586/Kubuntu-14.04/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(ftp://linuxcanada.com/pub/Quasar/${pkgver}/binaries/x86_64/Kubuntu-14.04/${pkgname}_${pkgver}-1_amd64.deb)
source=('Quasar.desktop'
        'QuasarAdmin.desktop')
install="$pkgname.install"
md5sums=('5f4ced3487aa7c1d15f4277dc4323ea5'
         'b176984b3719c47f231737215da45bf1')
md5sums_x86_64=('8d6212a0ae746b4ed6b447277d3f081d')
md5sums_i686=('b067509b58f09858ce996b8def59c38a')

package() {
  cd "${srcdir}"
  tar -x -J -f data.tar.xz
  cp -al opt "$pkgdir"
  install -Dm644 Quasar.desktop "${pkgdir}/usr/share/applications/Quasar.desktop"
  install -Dm644 QuasarAdmin.desktop "${pkgdir}/usr/share/applications/QuasarAdmin.desktop"
  install -Dm644 usr/share/doc/$pkgname/copyright "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
