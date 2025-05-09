# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact <admin@azccriminal.space>


pkgname=kernel-headers-trigger
pkgver=1.0
pkgrel=1
pkgdesc="Trigger tool for those who build Linux kernel header files from source file"
arch=('x86_64')
license=('GPL3') 
depends=('bash')  
source=(
  'kernel-build-patch-updated-revision.sh'
  'linux-headers.hook'
)
sha256sums=('SKIP'  
            'SKIP')

package() {
  # Install the script to /usr/local/bin
  install -Dm755 "${srcdir}/kernel-build-patch-updated-revision.sh" "${pkgdir}/usr/local/bin/kernel-build-patch-updated-revision"

  # Install the hook to /etc/pacman.d/hooks
  install -Dm644 "${srcdir}/linux-headers.hook" "${pkgdir}/etc/pacman.d/hooks/linux-headers.hook"

  
}
