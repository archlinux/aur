# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=vim-taskwarrior
pkgver=1.0
pkgrel=1
pkgdesc="vim interface for taskwarrior"
arch=(any)
url="https://github.com/blindFS/${pkgname}"
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('80a772dad0a31c628143fe4f2421b00fba8b3f09a2c3611ac4dad6e272e6bd1e')
package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  find autoload doc ftplugin plugin syntax -type d -exec install -d ${installpath}/{} \;
  find autoload doc ftplugin plugin syntax -type f -exec install -Dm644 {} ${installpath}/{} \;
}
