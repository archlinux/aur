# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
 
pkgname=pacback
pkgver=1.6.0
pkgrel=1
pkgdesc='Advanced Rollback Version Control for Arch Linux - Alpha'
arch=('any')
url='https://github.com/JustinTimperio/pacback'
license=('MIT')
provides=('pacback')
conflicts=('pacback-git')
depends=('python-tqdm' 'arch-install-scripts' 'curl')
optdepends=('pigz: Multithreaded de/compression of restore points')
source=('https://github.com/JustinTimperio/pacback/releases/download/v1.6.0/pacback_v1-6-0.tar')
sha512sums=('cfc8c652792e5bd3730f7265e4d871a70ec1058ee7f5fc3c0a4cfbb761167e7fce15a0c40c0613f47b526fbe007ca727d7237d0edc1628a101ca3c9e1fafbf83')
 
package() {
  cd "${srcdir}/${pkgname}"
  install -dm 755 "${pkgdir}"/{usr/share/pacback,usr/bin/}
  cp -dr --no-preserve='ownership' core "${pkgdir}"/usr/share/pacback
  ln -sf /usr/share/pacback/core/pacback.py "${pkgdir}"/usr/bin/pacback
}