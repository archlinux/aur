# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
 
pkgname=pacback
pkgver=1.6.1
pkgrel=1
pkgdesc='Advanced Rollback Version Control for Arch Linux - Alpha'
arch=('any')
url='https://github.com/JustinTimperio/pacback'
license=('MIT')
provides=('pacback')
conflicts=('pacback-git')
depends=('python-tqdm' 'arch-install-scripts' 'curl')
optdepends=('pigz: Multithreaded de/compression of restore points')
source=('https://github.com/JustinTimperio/pacback/releases/download/v1.6.1/pacback_v1-6-1.tar')
sha512sums=('2ca3299098049c423b11f0912c430b927f7867a6ec50088f0fa31076b099fbd784b3cf4ceb06e621526b217f32049805f6e01290a99a4605bb7367162a588378')
 
package() {
  cd "${srcdir}/${pkgname}"
  install -dm 755 "${pkgdir}"/{usr/share/pacback,usr/bin/}
  cp -dr --no-preserve='ownership' core "${pkgdir}"/usr/share/pacback
  ln -sf /usr/share/pacback/core/pacback.py "${pkgdir}"/usr/bin/pacback
}