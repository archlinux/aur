pkgname=netctl-eduroam-unicamp
pkgver=2
pkgrel=1
pkgdesc='Example configuration for eduroam at Unicamp using netctl'
arch=(any)
url='https://www.ccuec.unicamp.br/ccuec/servicos/rede_sem_fio_eduroam'
license=('GPL')
depends=(ca-certificates netctl)
install=install
source=('eduroam-unicamp'
        'https://www.ccuec.unicamp.br/ccuec/sites/default/files/tutoriais/ca.pem')
sha256sums=('e07ad95816c9fe63b4d9b118f751ac6d5ff3989e708753ccb303578d35f44e1c'
            'a54dcdb56032bbc5f2aab8cc37793404e94696e854bc3a888ff4144f3c847853')

package() {
  install -Dm644 eduroam-unicamp "$pkgdir/etc/netctl/examples/eduroam-unicamp"
  install -Dm644 ca.pem "$pkgdir/etc/ca-certificates/trust-source/anchors/eduroam-unicamp.crt"
}
