# Maintainer: Max Resch <resch.max@gmail.com>

pkgname=mkinitcpio-tpm-encrypt
pkgver=0.1
pkgrel=1
pkgdesc="mkinitcpio to decrypt LUKS passphrase with TPM"
url="https://aur.archlinux.org/packages/mkinitcpio-tpm-encrypt/"
arch=(any)
license=('GPL')
depends=('mkinitcpio' 'tpm-tools' 'trousers')
source=('install_tpm'
        'hook_tpm'
        'hosts'
        'passwd'
        'shadow'
        'README')

sha256sums=('da6ddaff8783a80568e8990016ee275a6e6ab64d57881a8438e5fadc0a5f07a1'
            '5630d592ab3adc2d461fa90026f2bcc0a81cc4219f62f968992c1c2cc8d958e1'
            '498f494232085ec83303a2bc6f04bea840c2b210fbbeda31a46a6e5674d4fc0e'
            '4b263523f4904bfe340a3208f327697ebd78f9f921e8be0dabdf33535c54a1b5'
            '674c97df063879b4ba04f70312dc67762a36dc81b49a2b2131e7f71432efa1a3'
            '70288bb0e9dc6bf4cd49079a503fb436c1b0b234f23201b24762e47db3cfd1ab')

package() {
  install -Dm644 install_tpm "${pkgdir}/usr/lib/initcpio/install/tpm"
  install -Dm644 hook_tpm "${pkgdir}/usr/lib/initcpio/hooks/tpm"
  install -Dm644 hosts "${pkgdir}/usr/lib/initcpio/tpm/hosts"
  install -Dm644 passwd "${pkgdir}/usr/lib/initcpio/tpm/passwd"
  install -Dm644 shadow "${pkgdir}/usr/lib/initcpio/tpm/shadow"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

