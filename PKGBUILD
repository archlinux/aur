pkgname=mkinitcpio-pkcs11
pkgver=0.3
pkgrel=1
pkgdesc='Install pkcs11 in early boot (systemd cryptsetyp.target) using pcscd.socket'
depends=('ccid' 'opensc' 'pcsclite' 'p11-kit' 'gnutls')
arch=('any')
source=('pkcs11_install' 'opensc.module')
sha256sums=(
  '0c62dd5eb978268ed13be851b9ac46dee9aaa52c655061da5ece4c69ab4ff8f7'
  'fea71e2e2c1853bba034106d4eb40646a787ed900fef883e09d38dcb29675db4'
)

package() {
    install -D -m644 "pkcs11_install" "$pkgdir/usr/lib/initcpio/install/pkcs11"
    install -D -m644 "opensc.module" "$pkgdir/etc/pkcs11/modules/opensc.module"
}
