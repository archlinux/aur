# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=dnscrypt-autoinstall
pkgver=0.3
pkgrel=9

pkgdesc='Choose your DNSCrypt provider'
arch=('any')
url='http://simonclausen.dk/2013/09/dnscrypt-autoinstaller/'
license=('GPL')

depends=('dnscrypt-proxy' 'libsodium' 'curl')
makedepends=('git')
install=dnscrypt-autoinstall.install
backup=('etc/conf.d/dnscrypt-config')
source=("git+https://github.com/simonclausen/dnscrypt-autoinstall")
sha1sums=('SKIP')

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname"-arch/"$pkgname"		"$pkgdir"/usr/bin/dnscrypt-autoinstall  
  install -Dm644 systemd/dnscrypt-config-dnscrypteu 	"$pkgdir"/etc/conf.d/dnscrypt-config
  install -Dm644 systemd/dnscrypt-proxy.service		"$pkgdir"/etc/systemd/system/dnscrypt-proxy.service
  install -Dm644 systemd/dnscrypt-proxy-backup.service  "$pkgdir"/etc/systemd/system/dnscrypt-proxy-backup.service
}

# vim:set ts=2 sw=2 et:
