# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
_pkgname=linuxed
pkgname=${_pkgname}-git
pkgver=0.r99.8d5081b
pkgrel=1
pkgdesc='Installer for EnhancedDiscord'
arch=('any')
url='https://github.com/Cr3atable/LinuxED'
license=('MIT')
depends=('python')
optdepends=('discord: Discord itself')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd 'LinuxED'
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd 'LinuxED'
  install -Dm755 LinuxED.py "${pkgdir}/usr/bin/LinuxED.py"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
