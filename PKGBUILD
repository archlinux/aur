# Maintainer: Doridian <archlinux at doridian dot net>

# Make sure to put "cleviseal" right after "clevis" in /etc/mkinitcpio.conf

pkgname=mkinitcpio-cleviseal-hook
pkgver=1.2
pkgrel=3
pkgdesc='An initcpio hook to extend PCRs after clevis to prevent unsealing the root volume key after initramfs'
arch=('any')
url='https://aur.archlinux.org/mkinitcpio-cleviseal-hook'
license=('MIT')
depends=('clevis' 'tpm2-tools' 'mkinitcpio' 'mkinitcpio-clevis-hook' 'python' 'python-yaml')
source=(
  'tpm-rebind.py'
  'cleviseal.hook'
  'cleviseal.install'
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  echo 'No build step needed'
}

package() {
  install -Dm644 "${srcdir}/cleviseal.hook" "${pkgdir}/etc/initcpio/hooks/cleviseal"
  install -Dm644 "${srcdir}/cleviseal.install" "${pkgdir}/etc/initcpio/install/cleviseal"
  install -Dm755 "${srcdir}/tpm-rebind.py" "${pkgdir}/usr/bin/cleviseal-tpm-rebind"
}
