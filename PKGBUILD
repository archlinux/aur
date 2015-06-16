# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=dnscrypt-autoinstall
pkgver=0.3
pkgrel=6

pkgdesc='Choose your DNSCrypt provider'
arch=('any')
url='http://simonclausen.dk/2013/09/dnscrypt-autoinstaller/'
license=('GPL')

depends=('dnscrypt-proxy' 'libsodium' 'curl')
makedepends=('git')
install=dnscrypt-autoinstall.install
source=("git+https://github.com/simonclausen/dnscrypt-autoinstall#branch=master")
sha1sums=('SKIP')

package() {
  cd "$pkgname"/dnscrypt-autoinstall-arch
  install -Dm755 dnscrypt-autoinstall "$pkgdir"/usr/bin/dnscrypt-autoinstall
  
  cd "$pkgname"/systemd
  install -Dm644 dnscrypt-config-dnscrypteu "$pkgdir"/etc/conf.d/dnscrypt-config
  install -Dm644 dnscrypt-proxy.service "$pkgdir"/etc/systemd/system/dnscrypt-proxy.service
  install -Dm644 dnscrypt-proxy-backup.service "$pkgdir"/etc/systemd/system/dnscrypt-proxy-backup.service
}

# vim:set ts=2 sw=2 et:
