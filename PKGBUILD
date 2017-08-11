# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=selinux-alpm-hook
pkgver=0.1
pkgrel=2
pkgdesc="SELinux ALPM hook"
arch=('any')
url="https://github.com/archlinuxhardened/selinux"
license=('GPL')
groups=('selinux')
depends=('policycoreutils')
source=('relabel-selinux.hook'
        'selinux-alpm-hook')
sha256sums=('4df844a89a50fe1caebe0cb92fc925b3dedf7a1a8258eef53f0dd328c1cc089e'
            '983695a355aeec32bd4dc16a4586f560d730e269cef3fe9aaede82ea0245862b')

package() {
  cd "${srcdir}"

  # Prefix the hook file with "zz-" so that it is run after all other hooks
  install -D -m 644 'relabel-selinux.hook' "${pkgdir}/usr/share/libalpm/hooks/zzz-relabel-selinux.hook"

  install -D -m 755 'selinux-alpm-hook' "${pkgdir}/usr/share/libalpm/scripts/selinux-alpm-hook"
}
