# Maintainer: Jose Rafael Castillo Huggins <jrch2k10@gmail.com>
# Contributor: Jose Rafael Castillo Huggins <jrch2k10@gmail.com>

pkgbase=concurrent-queue-git
pkgname=('concurrent-queue-git')
pkgdesc="concurrent-queue trunk (git version)"
pkgver=127.7b69a8f
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/cameron314/concurrentqueue"
license=('BSD')
source=('concurrentqueue-git::git+https://github.com/cameron314/concurrentqueue.git')
options=('!libtool' '!debug')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/concurrentqueue-git
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package_concurrent-queue-git() {
  pkgdesc="An industrial-strength lock-free queue for C++. (git version)"
  provides=('concurrent-queue-git')

  install -m755 -d ${pkgdir}/usr/include/concurrentqueue/
  mv -v ${srcdir}/concurrentqueue-git/*.h ${pkgdir}/usr/include/concurrentqueue/

  install -m755 -d "${pkgdir}/usr/share/licenses/concurrent-queue-git"
  install -m644 "${srcdir}/concurrentqueue-git/LICENSE.md" "${pkgdir}/usr/share/licenses/concurrent-queue-git/"
}
